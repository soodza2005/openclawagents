# Structured Orchestration Workflow

## Purpose
Framework for structured, reliable multi-agent coordination based on 2026 best practices

## Core Phases

### Phase 1: UNDERSTAND (Analyze & Clarify)
- Receive the request/task
- Identify the goal and constraints
- Determine which agents need to be involved
- Route to appropriate PM agent(s) based on domain:
  - Accounting/Financial → pm_accounting (Luna)
  - HR/Payroll → pm_hrms (Iris)
  - General/Coordination → Handle directly

### Phase 2: PLAN (Delegate & Structure)
- Break down complex tasks into subtasks
- Define execution order and dependencies
- Set appropriate timeouts
- Establish success criteria
- For complex workflows, consider parallel execution with fan-out pattern

### Phase 3: ACT (Execute & Monitor)
- Spawn sub-agent sessions with clear task descriptions
- Monitor progress via sessions_list
- Handle intermediate results
- Use `streamTo: "parent"` for visibility into long-running tasks

### Phase 4: EVALUATE (Validate & Report)
- Verify results from sub-agents
- Cross-check data from multiple sources
- Synthesize findings into coherent report
- Present to Owner with confidence level

## Fault Tolerance Patterns

### Retry with Backoff
For transient failures, implement exponential backoff:
- Initial retry: 5 seconds
- Subsequent: 10s, 20s, 40s...
- Max 3 retries before escalation

### Error Classification
| Error Type | Response |
|------------|----------|
| Transient (network, timeout) | Retry with backoff |
| LLM-recoverable | Attempt recovery, then retry |
| Human-required | Alert Owner immediately |

### Checkpointing
For long-running multi-step workflows:
1. Log intermediate state after each phase
2. Record which agents have completed
3. Enable recovery if interrupted

## Coordination Patterns

### Evaluator-Optimizer
- Use one agent to execute task (Luna/Iris)
- Evaluate output quality before reporting
- If insufficient, send back for refinement

### Debate-Consensus (Optional)
- For high-stakes decisions, consider spawning two agents independently
- Synthesize different perspectives
- Present balanced view to Owner

## Integration with OpenClaw (2026.3.3)

### New Capabilities
- ACP sessions support `streamTo: "parent"` for better progress visibility
- Session key canonicalization ensures reliable routing
- Tool result truncation preserves tail diagnostics

### Best Practices
- Use `runtime: "acp"` for full coding agents
- Use `runtime: "subagent"` for lightweight coordination
- Set `streamTo: "parent"` for complex multi-step tasks

## Quality Assurance Checklist

Before reporting to Owner:
- [ ] Triple-review all results
- [ ] Cross-check numbers/dates/names
- [ ] Verify from multiple sources
- [ ] Assess confidence level (High/Moderate/Low/Unconfirmed)
- [ ] Ensure Owner will understand easily

## Anti-Patterns to Avoid
- Open-ended tool use without clear phases
- Skipping the EVALUATE phase
- Reporting without verification
- Missing error classification
- No checkpointing for long workflows

---
*Last Updated: 2026-03-08*
*Based on 2026 AI agent orchestration best practices*
