# Tests

There are no automated tests yet. Use the operational checks:

- Readiness: `python -m tools.ops_readiness`
- Validate staged JSON: `./tools/validate_staged_json.ps1`
- Aggregate checks: `./tools/run_all_checks.ps1`
- Exchange sync (requires `SHAGI_EXCHANGE_PATH`): `python tools/exchange_all.py`

Evidence is written under `logs/`.
