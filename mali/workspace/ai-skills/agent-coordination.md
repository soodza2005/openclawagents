# Agent Coordination Skill

## Purpose
Framework for effectively coordinating multiple AI agents (sub-agents) in OpenClaw

## Core Principles

### 1. Session Management
- Use `sessions_spawn` to create isolated sub-agent sessions
- For coding tasks: use `runtime: "acp"` with `agentId` explicitly set
- Use `mode: "run"` for one-shot tasks, `mode: "session"` for persistent threads

### 2. Communication Patterns

#### Spawn with Reply
```
sessions_spawn(
  agentId="pm_accounting",
  task="Your task description",
  REPLY_SESSION_ID=currentSessionId
)
```

#### Send to Existing Session
```
sessions_send(
  sessionKey="pm_accounting:...",
  message="Follow-up task"
)
```

### 3. Runtime Options

| Option | Use Case |
|--------|----------|
| `runtime: "subagent"` | Lightweight sub-tasks |
| `runtime: "acp"` | Full coding agents (Codex, Claude Code) |
| `streamTo: "parent"` | Get progress updates in parent session |
| `thread: true` | Persistent thread-bound sessions (Discord) |

### 4. Best Practices

- Always provide clear, actionable task descriptions
- Set appropriate `timeoutSeconds` (300-600 for complex tasks)
- Use `attachments` for context files when needed
- Check `sessions_list` to monitor active sessions
- Use `sessions_history` to review past interactions

### 5. Anti-Patterns to Avoid

- DO NOT use `message` tool to communicate with PM agents (they don't receive Telegram)
- DO NOT spawn without clear task description
- DO NOT set extremely short timeouts for complex work
- DO NOT forget to check results from spawned sessions

### 6. Agent Routing Reference

| Agent | ID | Purpose |
|-------|-----|---------|
| Mali (self) | mali | Main coordinator |
| Luna | pm_accounting | Accounting, GL, AP, AR, Tax |
| Iris | pm_hrms | HR, Payroll, Leave, KPI |

### 7. Context Passing

When transferring work between agents:
1. Provide summary of what was done
2. Include relevant file paths
3. State specific next steps needed
4. Mention any constraints or priorities

## Monitoring

- Use `sessions_list(limit=10, messageLimit=1)` to see active sessions
- Check heartbeat-state.json for periodic check patterns
- Review compaction continuity for session state preservation

## Related OpenClaw Features (2026.3.3)

- ACP sessions now support `streamTo: "parent"` for better visibility
- Tool result truncation preserves tail diagnostics
- Session key canonicalization (lowercase) ensures reliable routing
- ACP session bootstrap retry mechanism reduces failures
- Coding-agent reliability improved with `--permission-mode bypassPermissions`

## Advanced Coordination Patterns (2026)

### Fault Tolerance Mechanisms
- **Retry with Backoff**: For transient errors (network, timeout), implement exponential backoff (5s → 10s → 20s → 40s)
- **Error Classification**:
  - Transient → Retry automatically
  - LLM-recoverable → Attempt recovery, then retry
  - Human-required → Alert Owner immediately
- **Checkpointing**: Log intermediate state after each phase for long-running workflows

### Structured Orchestration Phases
1. **UNDERSTAND** - Analyze request, identify goals, determine routing
2. **PLAN** - Break into subtasks, define order, set timeouts
3. **ACT** - Spawn sessions, monitor progress, handle results
4. **EVALUATE** - Verify, cross-check, synthesize, report

### Evaluator-Optimizer Pattern
- Use executing agent (Luna/Iris) for primary task
- Evaluate output quality before reporting
- If insufficient, send back for refinement

---
*Last Updated: 2026-03-08*
