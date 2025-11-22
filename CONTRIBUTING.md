# Contributing Guide

`tons_of_fun_ai_0` is the TONS-of-FUN genesis workspace—its mandate is to protect and amplify delight in Nightlands playtests. Contributions should reinforce that mission while preserving SHAGI safety doctrine.

## 1. Know the Mission

- Review `RUNBOOK.md`, `planning/pivotal_fronts/tons_of_fun.md`, and `planning/pivotal_fronts/fun_kpi_spec.md` before proposing changes.
- Anchor updates to fun KPIs (Time-to-Fun, Repeat-plays, "One more run?") and document expected impact.
- Keep evidence trails under `logs/` current; fun findings go in `logs/playtests/`.

## 2. Prepare Your Environment

1. Use Python 3.10+ and ensure PowerShell (`pwsh`) is available.
2. Set the exchange path (one-time per shell): ``$env:SHAGI_EXCHANGE_PATH = 'C:\\Users\\Admin\\high_command_exchange'``.
3. Verify wiring before editing: `./tools/heartbeat.ps1` then `python -m tools.ops_readiness`.
4. When ready to sync payloads, run `python tools/exchange_all.py` (writes details under `logs/`).

## 3. Operational Checks

- Aggregate readiness sweep: `./tools/run_all_checks.ps1`.
- Validate staged JSON before syncing: `./tools/validate_staged_json.ps1`.
- Emitter smoke (CLI wiring): `python tools/factory_order_emitter.py --help`.
- Capture outputs in `logs/` and reference them in notes or PR descriptions.

## 4. Working Conventions

- Scope changes narrowly; prefer iterative tweaks backed by playtest evidence.
- Reference motivating orders, reports, or pivot docs in commit messages and PRs.
- Keep comments purposeful—highlight doctrine, safety guardrails, or non-obvious fun logic.
- When adjusting balance or loops, outline expected KPI movement and rollback plan per the runbook.

## 5. Pull Requests & Reviews

1. Summarise the change, linked evidence, and validation steps in the PR description.
2. Attach or link relevant logs (heartbeat, readiness, playtest notes).
3. Request review from another tons_of_fun operator or High Command maintainer and wait for green checks.

## 6. Safety & Escalation

- Honour canary, rollback, and exploit gates described in `RUNBOOK.md` and related pivotal fronts.
- Escalate immediately via the exchange if fun KPIs regress or guardrail telemetry spikes.
- For urgent fixes, coordinate through the exchange so other theatres stay informed.

By contributing, you agree to abide by the `CODE_OF_CONDUCT.md` and the broader SHAGI safety doctrine.
