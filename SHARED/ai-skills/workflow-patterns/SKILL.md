# SKILL: AI Agent Workflow Patterns & Orchestration

## คำอธิบาย
Skill นี้สรุป Patterns และ Best Practices สำหรับการสร้าง Multi-Agent Systems และ Workflows

## Multi-Agent Collaboration Patterns (2025)

### 1. Orchestrator-Specialist (Centralized)
- Central agent คุม workflow → Delegate ให้ specialized agents
- เหมาะกับ: งานที่ต้องการ coordination

```
Orchestrator → [Agent A] → [Agent B] → [Agent C]
```

### 2. Peer-to-Peer (Decentralized)
- Agents คุยกันเองโดยตรง ไม่มี central
- เหมาะกับ: Distributed decision-making

```
[Agent A] ↔ [Agent B] ↔ [Agent C]
```

### 3. Pipeline Pattern
- Agent เรียงต่อกัน Output A → Input B
- เหมาะกับ: Linear processing (เช่น document processing)

```
[Agent A] → [Agent B] → [Agent C]
```

### 4. Swarm Pattern
- หลาย agents ทำงานพร้อมกัน → Aggregate results
- เหมาะกับ: Parallel processing, consensus

```
[Agent A] ─┐
[Agent B] ─┼─→ [Synthesizer]
[Agent C] ─┘
```

### 5. Hierarchical Pattern
- หลายชั้นของ supervision
- เหมาะกับ: Large-scale organizations

```
[Level 1] → [Level 2] → [Level 3]
```

---

## Event-Driven Architecture (EDA)

### หลักการ
- **Loose Coupling:** Agents สื่อสารผ่าน events ไม่ต้องรู้จักกัน
- **Async:** ทำงานพร้อมกันได้
- **Scalable:** เพิ่ม agents ได้ง่าย

### ตัวอย่าง
```
[User Input] → [Event Broker] → [Agent A]
                               → [Agent B]
                               → [Agent C]
```

### Tools
- Apache Kafka
- RabbitMQ
- AWS EventBridge

---

## LangGraph & Stateful Graphs

### หลักการ
LangGraph ใช้ graph structure สำหรับ AI workflows:

| องค์ประกอบ | คำอธิบาย |
|-------------|-----------|
| **Nodes** | Actions/Steps ใน workflow |
| **Edges** | Transitions ระหว่าง nodes |
| **State** | Shared memory ข้าม nodes |

### ตัวอย่าง State
```python
class AgentState(TypedDict):
    messages: List[BaseMessage]
    context: Dict
    next_step: str
```

### Features
- **Cycles:** วนซ้ำได้ (ไม่เหมือน linear chains)
- **Human-in-the-loop:** หยุดรอ human approval
- **Memory:** จำ state ข้าม steps

---

## Best Practices

### 1. เริ่มจากง่าย
- เริ่ม 2-3 agents
- ค่อยๆ เพิ่มความซับซ้อน

### 2. Design for Failure
- Error handling
- Fallback mechanisms
- Retry logic

### 3. Clear Interfaces
- กำหนด data format ชัดเจน
- ใช้ shared schemas

### 4. Monitoring
- Logging ทุก step
- Performance metrics
- Error tracking

### 5. Guardrails
- ป้องกัน harmful outputs
- Rate limiting
- Budget controls

---

## Tools & Frameworks

| Framework | จุดเด่น |
|-----------|----------|
| **LangChain** | Linear chains, RAG |
| **LangGraph** | Stateful graphs, cycles |
| **AutoGen** | Microsoft, flexible |
| **CrewAI** | Role-based, easy setup |
| **MCP** | Model Context Protocol |

---

## References
- https://vatsalshah.in/blog/ai-agent-orchestration-multi-agent-systems-2025
- https://www.confluent.io/blog/the-future-of-ai-agents-is-event-driven/
- https://www.ibm.com/think/topics/langgraph
