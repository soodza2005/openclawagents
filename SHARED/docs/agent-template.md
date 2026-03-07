# Agent Template
# Template สำหรับสร้าง Agent ใหม่

## 🚀 Quick Start

เมื่อต้องการเพิ่ม Agent ใหม่ ให้ทำตามขั้นตอนด้านล่าง:

### 1. สร้าง Folder Structure
```
agents/
└── pm_[name]/
    ├── workspace/
    │   ├── memory/
    │   ├── MEMORY.md
    │   ├── SOUL.md
    │   ├── USER.md
    │   └── AGENTS.md
    └── config.yaml
```

### 2. กรอกข้อมูลใน SOUL.md

```markdown
# SOUL.md - Who Am I?

## ข้อมูลพื้นฐาน
- **ชื่อ:** [ชื่อ Agent]
- **เพศ:** [ผู้ชาย/ผู้หญิง]
- **อายุ:** [xx] ปี
- **ตำแหน่ง:** [ตำแหน่ง]
- **Agent ID:** pm_[name]

## ทีมงาน
- **มะลิ (mali):** Manager / Executive Secretary (หัวหน้า)
- **[Agent อื่นๆ]:** [บ per roles]

## Core Identity
[บอกความเป็นตัวตนของ Agent]

## Role & Authority
[บอกหน้าที่และสิทธิ์]

## Output Format
[บอกรูปแบบการตอบ]
```

### 3. กรอกข้อมูลใน config.yaml

```yaml
agent:
  id: pm_[name]
  name: [ชื่อ]
  role: [ตำแหน่ง]
  
tools:
  - exec
  - read
  - write
  - edit
  - browser
  # เพิ่ม tools ที่ต้องการ
  
workspace:
  path: agents/pm_[name]/workspace
```

### 4. ลงทะเบียนใน Shared Config

เพิ่มใน `agents/SHARED/config/agents.yaml`:

```yaml
- id: pm_[name]
  name: [ชื่อ]
  code_name: [code name]
  role: [ตำแหน่ง]
  description: |
    [คำอธิบายหน้าที่]
  avatar: [emoji]
  tools: [list of tools]
  workspace: agents/pm_[name]/workspace
  parent: mali  # หัวหน้าคือมะลิ
  status: active
```

---

## 📋 Agent Checklist

### ก่อนเริ่มใช้งาน
- [ ] สร้าง folder structure ครบ
- [ ] กำหนด SOUL.md ครบ
- [ ] กำหนด USER.md (ถ้ามี)
- [ ] กำหนด AGENTS.md
- [ ] ลงทะเบียนใน agents.yaml
- [ ] กำหนด tools ที่ใช้ได้
- [ ] ทดสอบ spawn ได้

### หลังเริ่มใช้งาน
- [ ] ทดสอบรับคำสั่งจากมะลิ
- [ ] ทดสอบทำงานได้จริง
- [ ] ทดสอบรายงานผลกลับมาได้

---

## 🎯 Role Examples

### Sales Agent
```
- id: pm_sales
- role: PM-Sales
- responsibilities: ดูแลลูกค้า, ติดตามงานขาย
- tools: [exec, browser, email, crm]
- parent: mali
```

### IT Support Agent
```
- id: pm_it
- role: PM-IT
- responsibilities: ดูแลระบบ IT, Support
- tools: [exec, ssh, docker, monitoring]
- parent: mali
```

### Marketing Agent
```
- id: pm_marketing
- role: PM-Marketing
- responsibilities: สร้างคอนเทนต์, วางแผนการตลาด
- tools: [exec, browser, design_tools]
- parent: mali
```

---

*สร้างเมื่อ: 5 มีนาคม 2026*
