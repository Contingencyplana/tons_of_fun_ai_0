# tons_of_fun_ai_0 — Runbook (v0)

Purpose: fun-first playtest lab for Nightlands. Optimize moment-to-moment feel, reduce friction, and raise “one more run?” impulses.

KPIs
- Time-to-Fun (TtF): seconds to first smile/wow moment
- Repeat-plays per session: count within a 20–30 min window
- One more run?: yes/no (operator judgment)

Operator Loop (per playtest)
- Prep: confirm heartbeat/sync OK; clear logs window
- Run: storyboard Nightlands vignette with comfort on; record qualitative notes
- Sync: run targeted sync (quiet) to mirror payloads; capture trace IDs
- Tweak: apply exactly one gameplay/feel tweak; rerun; compare notes
- Log: append metrics and excerpts under `logs/playtests/`

Evidence
- Heartbeat/sync: tools outputs saved under `logs/ops_readiness.txt`
- Contract/overlay smoke outputs: `logs/contract_tests/`
- Playtest feedback: `logs/playtests/<YYYYMMDD>_session.jsonl`

Doc Refresh Cadence
- Follow `docs/daily_doc_refresh.md` each work block; treat `planning/document_refresh_queue.md` as the source for targets and scope.
- After every scroll touched, append a ledger entry to `C:\Users\Admin\high_command_exchange\ledger\2025-11.md` using the `YYYY-MM-DD HH:MM TonsOfFun DOC-REFRESH <summary>` format.
- Mirror changes via `python tools/exchange_all.py` (writes `logs/exchange_all.json`) so the hub stays in sync before handoff.

References
- exchange/attachments/guides/comfort_happy_path.md
- planning/pivotal_fronts/tons_of_fun.md
