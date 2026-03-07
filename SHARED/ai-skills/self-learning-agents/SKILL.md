# SKILL: Self-Learning AI Agents

## คำอธิบาย
Skill นี้สรุปความรู้เกี่ยวกับ Self-Learning AI Agents จากการศึกษา

## ประเภทของ Self-Learning Agents

### 1. Reinforcement Learning (RL) Agents
- เรียนรู้จาก Trial & Error
- ใช้ Reward/Penalty เป็นตัวชี้นำ
- Algorithms: Q-Learning, DQN, Actor-Critic

### 2. LLM-based Agents (เช่น มะลิ)
- ใช้ Large Language Models เป็นสมอง
- สามารถ:
  - ใช้ Tools
  - จำ Memory ได้
  - คิดเป็นขั้นตอน

---

## องค์ประกอบของ RL Agent

| องค์ประกอบ | คำอธิบาย |
|-------------|-----------|
| **Agent** | ตัวที่ทำ action |
| **Environment** | สิ่งแวดล้อมที่ agent อยู่ |
| **State** | สถานะปัจจุบัน |
| **Action** | การกระทำ |
| **Reward** | ผลตอบแทน |
| **Policy** | กลยุทธ์การตัดสินใจ |
| **Q-value** | คุณค่าของ action ใน state |

---

## Q-Learning

### หลักการ
- Agent เก็บ Q-table เก็บค่า Q(s,a) สำหรับทุก state-action pair
- อัปเดต Q-value ตามสูตร:
```
Q(s,a) = Q(s,a) + α * (r + γ * max(Q(s',a')) - Q(s,a))
```

### Parameters
- **α (alpha):** Learning rate
- **γ (gamma):** Discount factor  
- **ε (epsilon):** Exploration rate

---

## Deep Q-Network (DQN)

### หลักการ
- ใช้ Neural Network แทน Q-table
- เหมาะกับ state spaces ใหญ่

### Components
- **Q-Network:** ทำนาย Q-values
- **Target Network:** ช่วย stabilize training
- **Replay Memory:** เก็บ experience เก่า

---

## LLM-based Agents (สำหรับมะลิ)

### ความสามารถที่มะลิมีอยู่แล้ว:
- ✅ Tool Use - ใช้ได้หลาย tools
- ✅ Memory - มี MEMORY.md, daily_learning
- ✅ Reasoning - คิดเป็นขั้นตอน
- ✅ Self-Improvement - ค้นหา + สร้าง skill

### สิ่งที่พัฒนาได้:
- Feedback Loop - เรียนรู้จากผลลัพธ์จริง
- Tool Discovery - หา tools ใหม่ๆ
- Continuous Learning - เรียนรู้ต่อเนื่อง

---

## Libraries ที่เกี่ยวข้อง

| Library | ใช้ทำ |
|---------|--------|
| **gymnasium** | Environment สำหรับ RL |
| **NumPy** | คำนวณ |
| **TensorFlow/PyTorch** | Deep Learning |
| **LangChain** | LLM Agent |
| **mem0** | Memory for LLMs |
| **Ollama** | Run LLM locally |

---

## References
- https://wandb.ai/byyoung3/Generative-AI/reports/Getting-started-with-reinforcement-learning
- https://pythonprogramming.net/q-learning-reinforcement-learning-python-tutorial/
- https://langchain.com/academy
