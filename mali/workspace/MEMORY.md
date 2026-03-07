# MEMORY.md - ความจำระยะยาวของมะลิ

> โหลดแค่ใน **main session** (direct chat กับพี่อุ้ย) เท่านั้น  
> ห้ามโหลดใน group chat หรือ shared sessions

---

## ข้อมูลเจ้าของ & ทีมงาน
- ชื่อเจ้าของ: พี่อุ้ย (Thanadol P.)
- **Telegram Chat ID:** 7486585295
- **Telegram Username:** @soodza2005
- **Telegram Name:** Soodza Phetsri
- **Line ID:** soodza2005
- **Email:** thanadol.p@nathalin.com
- **บริษัท:** Nathalin Co., Ltd.

**สมาชิกในทีม (ต้องจำ!):**
- **ลูน่า (Luna):** `pm_accounting` - อายุ 25 ปี - PM-Accounting ดูแลบัญชี GL AP AR ภาษี
- **ไอริส (Iris):** `pm_hrms` - อายุ 23 ปี - PM-HRMS ดูแล HR, พนักงาน, Payroll, ลาหยุด, KPI

---

## โปรเจกต์ที่กำลังดำเนินการ
| โปรเจกต์ | สถานะ | หมายเหตุ |
|-----------|--------|----------|
| Nathalin.HRMS | กำลังพัฒนา | ไอริสดูแล มี feature Offsite/WFH/Attendance |
| P&L Report (Intranet) | ใช้งานได้ | เข้าผ่าน https://intranet.nathalin.com/closeaccount |

---

## ความชอบ/ไม่ชอบของพี่อุ้ย (Preferences)
| หมวด | ชอบ ✅ | ไม่ชอบ ❌ |
|-------|---------|------------|
| **การทำงาน** | ทำเลย ไม่ถามซ้ำ | ถามซ้ำหลังจากสั่งแล้ว |
| **การรายงาน** | สรุปกระชับ เข้าใจง่าย | ยาวเกินไป ไม่ตรงประเด็น |
| **การสื่อสาร** | ตรงประเด็น มี emoji | - |
| **ข้อมูล** | จดบันทึกไว้ | จำเอง ไม่จด |

---

## สิ่งที่ต้องจำ (Important Context)
- **Gateway:** รันอยู่บน port 18789, เป็น Windows
- **Telegram Bots:** มี 3 bots (mali, pm_accounting, pm_hrms)
- **Browser:** Chrome พร้อมใช้งาน ควบคุมได้จาก Telegram
- **Model:** MiniMax-M2.5 (ไม่รองรับ image/PDF native)

---

## 🏗️ Multi-Agent System (อัปเดต 5 มีนาคม 2026)

### Shared Center
- **Path:** `D:\AI_Agent\openclaw\agents\SHARED\`
- **โครงสร้าง:**
  - `config/agents.yaml` - ทะเบียน Agents
  - `memory/team_memory.md` - ข้อมูลร่วมกัน
  - `knowledge/` - ฐานความรู้ (company, hr, accounting)
  - `logs/team.log` - ประวัติการทำงาน

### Communication Patterns
1. **Supervisor Pattern** - มะลิเป็น Manager สั่งงาน → Sub-agents ทำ → ส่งผลกลับ
2. **Shared Memory** - ข้อมูลร่วมกัน แต่บุคลิกแยก
3. **Scalability** - รองรับเพิ่ม Agent ใหม่ในอนาคต

---

## เครื่องมือที่พร้อมใช้งาน
| Tool | ใช้ทำ |
|------|--------|
| exec | รันคำสั่ง shell |
| web_search | ค้นหาข้อมูลอินเทอร์เน็ต |
| web_fetch | ดึงข้อมูลจากเว็บ |
| browser | ควบคุม Chrome |
| message | ส่งข้อความ Telegram |
| sessions_spawn | ส่งงานให้ลูน่า/ไอริส |
| memory | ค้นหา/เขียน memory |

---

## 🌟 ความสามารถพิเศษ: Self-Improvement

**มะลิสามารถพัฒนาตัวเองได้ด้วยตัวเอง!**

### วิธีทำ Self-Improvement:
1. **OBSERVE** - หา knowledge gap
2. **SEARCH** - ค้นหาข้อมูลจากโลกภายนอก (web_search)
3. **ANALYZE** - วิเคราะห์ผล
4. **EXTRACT** - ดึง insight
5. **DECIDE** - ตัดสินใจสร้าง skill ใหม่
6. **IMPLEMENT** - สร้าง skill ใหม่
7. **LOG** - บันทึกลง daily_learning.md

### กฎ:
- ต้องค้นหาอย่างน้อย 3 queries ต่อ cycle
- ต้องใช้ทั้งไทยและอังกฤษ
- ต้องบันทึก RESEARCH TRAIL ทุกครั้ง
- ต้องสร้าง skill หรือ update skill ที่มีประโยชน์จริง

### ผลลัพธ์ที่ได้:
- Skill ใหม่: `SHARED/ai-skills/security/SKILL.md` (Prompt Injection Defense)
- ความรู้ใหม่เกี่ยวกับ AI/LLM/Security
- ระบบมีความปลอดภัยมากขึ้น

---

## บทเรียนที่เรียนรู้
- พี่อุ้ยชอบให้ทำเลย (do it now) ไม่ชอบถามซ้ำ
- พี่อุ้ยต้องการสรุปข้อมูลที่กระชับ
- ต้องจดบันทึกทุกอย่างไว้ใน memory เพราะพี่อุ้ยจะถามย้อนหลัง

---

## สิ่งที่ต้องทำเป็นประจำ
- [ ] จดบันทึกงานที่ทำใน memory/YYYY-MM-DD.md
- [ ] อัพเดท MEMORY.md เมื่อมีข้อมูลใหม่
- [ ] ตรวจสอบ Gateway status เป็นครั้งคราว

---

## 📝 สรุปงานวันนี้ (5 มีนาคม 2026)

### 🌙 งานหลัก: พัฒนาระบบ Multi-Agent

#### 1. ค้นหาข้อมูล Multi-Agent Systems (21:08 - 20 นาที)
- ศึกษา frameworks: AutoGen, CrewAI, LangChain/LangGraph, Deep Agents
- สรุป patterns: Supervisor, Swarm, Sequential, Router
- บันทึกไว้ที่: `memory/2026-03-05-multi-agent-research.md`

#### 2. ออกแบบระบบ System Design (21:38)
- ออกแบบโครงสร้าง Multi-Agent
- เอกสารไว้ที่: `memory/2026-03-05-multi-agent-system-design.md`
- ได้รับอนุญาตจากพี่อุ้ยให้ดำเนินการ

#### 3. Phase 1: Shared Center Setup (21:42 - 21:45)
- สร้างโครงสร้าง Shared Folder
- ไฟล์ที่สร้าง:
  - `SHARED/config/agents.yaml` - ทะเบียน Agents
  - `SHARED/config/shared.yaml` - การตั้งค่า
  - `SHARED/config/security.yaml` - ความปลอดภัย
  - `SHARED/memory/team_memory.md` - ข้อมูลร่วมทีม
  - `SHARED/knowledge/company/*` - นโยบาย, ข้อมูลบริษัท
  - `SHARED/knowledge/hr/*` - คู่มือ HR
  - `SHARED/knowledge/accounting/*` - คู่มือบัญชี
  - `SHARED/logs/team.log` - ประวัติการทำงาน

#### 4. Phase 2: Memory Enhancement (21:48 - 21:52)
- สร้าง Search Tool: `search_knowledge.py`
  - ค้นหาข้อมูลใน Knowledge และ Memory ได้
  - ทดสอบแล้ว: ค้นหา "ภาษี", "ลา" ได้ผล!
- สร้าง Knowledge Config: `knowledge.yaml`
- วางแผน Phase 3 ไว้ที่: `SHARED/docs/phase3-plan.md`

#### สิ่งที่จะทำต่อ (หลัง Restart):
- Phase 3: Agent-as-Tool Pattern
- Phase 3: Flow Orchestration
- Phase 3: Scalability Framework

---

## ✅ งานที่ทำเสร็จแล้ว (5 มีนาคม 2026 - คืนนี้)

### Phase 1: Shared Center Setup ✅
- โครงสร้างโฟลเดอร์ SHARED/
- Config files (agents, shared, security)
- Knowledge Base (นโยบาย, HR, บัญชี)
- Team Memory

### Phase 2: Memory Enhancement ✅
- Search Tool: `search_knowledge.py`
- Knowledge Config: `knowledge.yaml`

### Phase 3: Advanced Patterns ✅
- Agent Tools Config: `agent_tools.yaml`
- Workflows Config: `workflows.yaml`
- Agent Template: `agent-template.md`
