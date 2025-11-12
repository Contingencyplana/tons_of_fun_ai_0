# tons_of_fun_ai_0

Genesis workspace scaffold.

- Purpose: see RUNBOOK.md
- Exchange path: set SHAGI_EXCHANGE_PATH locally
- Ops: run heartbeat/sync via High Command tools until local wrappers exist

## Python commands
- Readiness: `python -m tools.ops_readiness`
- Exchange (validate + sync): `python tools/exchange_all.py`

## Exchange (shared hub)
- Set hub path: `$env:SHAGI_EXCHANGE_PATH = 'C:\\Users\\Admin\\high_command_exchange'`
- Stage an order: `./tools/stage_order.ps1 -Title 'Hello from tons_of_fun_ai_0'`
- Stage a report: `./tools/stage_report.ps1 -OrderId '<order-id>' -Summary 'Done'`
- Stage an ack: `./tools/stage_ack.ps1 -OrderId '<order-id>' -Notes 'received'`
- Sync outbox to hub: `./tools/sync_outbox_to_hub.ps1`

Pre-sync validate (recommended): `./tools/validate_staged_json.ps1` (writes `logs/validate_staged.json`)

Tests (smoke): `./tests/smoke_checks.ps1` (writes `logs/tests_smoke.json`)

Staging dirs in this repo: `outbox/orders/`, `outbox/reports/`, `outbox/acks/`. Hub remains the source of truth.
