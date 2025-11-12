# Outbox

Staging area for Exchange sync. Files here are validated and then copied to the hub path (see `SHAGI_EXCHANGE_PATH` or `exchange/config.json`).

- Orders: `outbox/orders/*.json`
- Acknowledgements: `outbox/acks/*.json`
- Reports: `outbox/reports/*.json`

Helpers
- Stage order: `tools/stage_order.ps1`
- Stage ack: `tools/stage_ack.ps1`
- Stage report: `tools/stage_report.ps1`
- Validate staged JSON: `tools/validate_staged_json.ps1`
- Sync to hub: `python tools/exchange_all.py`

Note: Empty folders include `.gitkeep` to keep them in version control.
