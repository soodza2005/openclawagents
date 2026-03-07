# SKILL: AI Agent Skill Acquisition

## คำอธิบาย
Skill นี้สอนวิธีที่ AI Agent สามารถเรียนรู้ Skills ใหม่ๆ จากตัวอย่าง

## ทำไมต้องมี Skill Acquisition?

| เหตุผล | รายละเอียด |
|---------|-------------|
| **ปรับตัว** | เรียนรู้ task ใหม่โดยไม่ต้องเขียน code ใหม่ |
| **ขยายความสามารถ** | เพิ่ม tools อัตโนมัติ |
| **Personalize** | เรียนรู้ preferences ของ user |

---

## 3 วิธีหลัก

### 1. Learning from Demonstration (LfD)

```python
# สอนโดยการแสดงตัวอย่าง
examples = [
    {"input": "จัดประชุม", "output": "สร้าง calendar event + ส่ง invite"},
    {"input": "ส่งรายงาน", "output": "สร้าง PDF + ส่ง email"},
]

# Agent เรียนรู้ pattern
agent.learn_from_examples(examples)
```

### 2. Skill Extraction from Feedback

```python
# หลังจากทำงาน
user_feedback = "ทำได้ดีมาก แต่อยากให้ส่ง reminder ก่อน 1 วัน"

# Extract เป็น skill ใหม่
skill = agent.extract_skill(user_feedback)
# → "เมื่อสร้าง event ให้ส่ง reminder ก่อน 1 วัน"
```

### 3. Tool Discovery & Learning

```python
# Agent ค้นหา tools ใหม่ๆ ที่ available
available_tools = agent.discover_tools()

# เรียนรู้วิธีใช้
agent.learn_tool_usage(new_tool)
```

---

## Skill Acquisition Pipeline

```
1. Observe (สังเกต)
   ↓
2. Extract Pattern (ดึง pattern)
   ↓
3. Generalize (สรุปเป็นกฎ)
   ↓
4. Store as Skill (เก็บเป็น skill)
   ↓
5. Apply (นำไปใช้)
```

---

## Real-World Examples

| Industry | Skill ที่เรียนรู้ |
|----------|-----------------|
| **Coding** | Debug, Test, Refactor |
| **Marketing** | Campaign, Content, SEO |
| **Support** | Ticket, Response, Escalate |
| **Data** | Analyze, Visualize, Report |

---

## Agent Skills Standard

```yaml
skill:
  name: "Email Organizer"
  description: "จัดระเบียบอีเมล"
  triggers:
    - "email"
    - "จัด"
  actions:
    - label: email
      tool: gmail
      params: {}
  examples:
    - input: "จัด inbox"
      output: "label:promotion move:Archive"
```

---

## Best Practices

| ควรทำ | ไม่ควร |
|--------|---------|
| เก็บหลายตัวอย่าง | เก็บแค่ 1 ตัวอย่าง |
| ทดสอบก่อน deploy | deploy เลยไม่ทดสอบ |
| มี fallback | ปล่อยให้ fail เงียบๆ |
| Monitor quality | ไม่เช็คผลลัพธ์ |

---

## References
- https://shadecoder.com/topics/learning-from-demonstration-a-comprehensive-guide-for-2025
- https://relevanceai.com/blog/how-to-build-an-ai-agent
- https://xcubelabs.com/blog/10-real-world-examples-of-ai-agents-in-2025/
