import json, os
from pathlib import Path
from datetime import datetime, timezone

ROOT = Path(__file__).resolve().parents[1]
LOGS = ROOT / "logs"

REQUIRED_DIRS = [
    ROOT / "outbox" / "orders",
    ROOT / "outbox" / "acks",
    ROOT / "outbox" / "reports",
]

REQUIRED_TOOLS = [
    ROOT / "tools" / "validate_staged_json.ps1",
    ROOT / "tools" / "stage_order.ps1",
    ROOT / "tools" / "stage_ack.ps1",
    ROOT / "tools" / "stage_report.ps1",
    ROOT / "tools" / "sync_outbox_to_hub.ps1",
    ROOT / "tools" / "exchange_all.py",
]

def iso_now():
    return datetime.now(timezone.utc).isoformat()

def read_hub_path():
    env = os.environ.get("SHAGI_EXCHANGE_PATH")
    if env:
        return env
    cfg = ROOT / "exchange" / "config.json"
    try:
        if cfg.exists():
            obj = json.loads(cfg.read_text(encoding="utf-8"))
            hp = obj.get("hub_path")
            if hp:
                return hp
    except Exception:
        pass
    return None

def main():
    checks = {
        "dirs_present": {},
        "tools_present": {},
        "hub_path": None,
        "hub_path_found": False,
    }

    for d in REQUIRED_DIRS:
        checks["dirs_present"][str(d.relative_to(ROOT))] = d.exists()

    for t in REQUIRED_TOOLS:
        checks["tools_present"][str(t.relative_to(ROOT))] = t.exists()

    hub = read_hub_path()
    checks["hub_path"] = hub
    checks["hub_path_found"] = hub is not None

    ok = all(checks["dirs_present"].values()) and all(checks["tools_present"].values()) and checks["hub_path_found"]

    LOGS.mkdir(parents=True, exist_ok=True)
    payload = {
        "timestamp_utc": iso_now(),
        "workspace": "tons_of_fun_ai_0",
        "results": checks,
        "ready": ok,
    }
    (LOGS / "ops_readiness.json").write_text(json.dumps(payload, indent=2), encoding="utf-8")

    # Console summary
    print(f"hub_path: {hub if hub else 'MISSING'}")
    missing = []
    missing += [k for k, v in checks["dirs_present"].items() if not v]
    missing += [k for k, v in checks["tools_present"].items() if not v]
    if not checks["hub_path_found"]:
        missing.append("SHAGI_EXCHANGE_PATH or exchange/config.json:hub_path")
    if missing:
        print("Missing:")
        for m in missing:
            print(f" - {m}")
    return 0 if ok else 1

if __name__ == "__main__":
    raise SystemExit(main())
