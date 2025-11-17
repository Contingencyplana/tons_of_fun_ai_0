# Doc Map (tons_of_fun_ai_0)

- README: `README.md`
- Runbook (workspace): `planning/workspaces/tons_of_fun_ai_0/RUNBOOK.md`
- Exchange overview: `exchange/README.md`
- Pivotal fronts index: `planning/pivotal_fronts/README.md`
- Operator crib sheet: `planning/operator_crib_sheet.md`
- Commands (staging/sync): `tools/stage_order.ps1`, `tools/stage_ack.ps1`, `tools/stage_report.ps1`, `tools/sync_outbox_to_hub.ps1`, `tools/validate_staged_json.ps1`, `tools/exchange_all.py`
- Checks: `tools/run_all_checks.ps1`, `tools/check_docs.ps1`, `python -m tools.ops_readiness`
- Evidence logs directory: `logs/`
- Daily doc refresh cadence: `docs/daily_doc_refresh.md`

Notes
- Hub path is read from `SHAGI_EXCHANGE_PATH` or `exchange/config.json`.
- Keep logs under `logs/` and avoid secrets in docs.
