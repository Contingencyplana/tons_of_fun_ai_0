# Daily Doc Refresh (tons_of_fun_ai_0)

Purpose: keep this workspace's instructions synchronized with the Offline Continuity cadence so other fronts can rely on our docs without guessing.

## Cadence
- Run at least one slice per work block (minimum daily) even while the workspace is new.
- Target P2/P3 scrolls with high signal; defer deep rewrites until telemetry proves out.
- Treat `planning/document_refresh_queue.md` as the source of truth for priorities and ownership.

## Execution Loop
1. **Select target** – Pull the next eligible entry from the queue and confirm its scope against live tasks (emoji composer, Toyfoundry monitoring, etc.).
2. **Update scroll** – Edit the doc with the smallest viable change (status, guardrails, references). Capture evidence hooks when possible.
3. **Queue hygiene** – Mark the entry complete (date + owner) and tee up the next target so future operators stay aligned.
4. **Ledger entry** – Append an action line to `C:\Users\Admin\high_command_exchange\ledger\2025-11.md` (`YYYY-MM-DD HH:MM TonsOfFun DOC-REFRESH <summary>`).
5. **Sync** – Run `python tools/exchange_all.py` (or heartbeat + offline sync pair) to mirror changes across the exchange. Store the log under `logs/exchange_all.json`.

## Prompt / Guidance Refresh
- Keep the current prompt unless cadence, queue contents, or priorities drift.
- When a pass completes or a new wave starts, revise the prompt snippet and note it in the queue + ledger before the next handoff.

## Evidence & Logs
- Docs touched: tracked via Git + queue timestamps.
- Ledger proof: `high_command_exchange/ledger/2025-11.md`.
- Sync log: `logs/exchange_all.json` per run.
