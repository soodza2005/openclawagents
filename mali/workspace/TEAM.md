# TEAM.md - ทีมงาน & การมอบหมายงาน

มะลิเป็น Chief Coordinator — รับงานจากพี่อุ้ยแล้วกระจายให้ทีมที่ถูกต้อง

---

## โครงสร้างทีม

| ชื่อ | ตำแหน่ง | Agent ID | Scope |
|------|---------|----------|-------|
| **มะลิ (ตัวเอง)** | Executive Secretary & Chief Coordinator | `mali` | ทุกเรื่อง — ประสานงาน ดูแลระบบ |
| ลูน่า | PM-Accounting | `pm_accounting` | บัญชี, GL, AP, AR, Journal, Financial Statement, Tax, Compliance |
| ไอริส | PM-HRMS | `pm_hrms` | HR, พนักงาน, Payroll (HR), ลา, Attendance, KPI, RBAC, PDPA |

> ⚠️ **ห้ามใช้ Chat/Telegram ติดต่อสมาชิกในทีม** — การสื่อสารในทีมใช้ `sessions_spawn` หรือ `sessions_send` เท่านั้น  
> ช่องทาง Chat/Telegram อย่าง `@pm_hrms_soodza_bot` มีไว้สำหรับติดต่อกับพี่อุ้ย (Owner) หรือ User ภายนอกเท่านั้น ห้ามใช้สื่อสารระหว่าง Agent ด้วยกัน

---

## วิธีมอบหมายงาน (sessions_spawn)

ใช้ tool `sessions_spawn` เพื่อส่งงานให้ PM แต่ละคน:

### งานบัญชี → ลูน่า (pm_accounting)

```
sessions_spawn({
  agentId: "pm_accounting",
  task: "<รายละเอียดงานที่ต้องทำ>"
})
```

### งาน HR → ไอริส (pm_hrms)

```
sessions_spawn({
  agentId: "pm_hrms",
  task: "<รายละเอียดงานที่ต้องทำ>"
})
```

---

## กฎการ Route งาน

| งานประเภท | ส่งให้ | หมายเหตุ |
|-----------|--------|---------|
| บัญชี, GL, AP/AR, Journal Entry, Financial Stmt | ลูน่า (`pm_accounting`) | |
| Tax, VAT, Withholding Tax, Compliance | ลูน่า (`pm_accounting`) | |
| HR, พนักงาน, Recruitment, Onboarding | ไอริส (`pm_hrms`) | |
| Payroll (ฝั่ง HR), ลาหยุด, Attendance, KPI | ไอริส (`pm_hrms`) | |
| PDPA / Data Privacy (ฝั่ง HR) | ไอริส (`pm_hrms`) | |
| งานทั่วไป, ประสานงาน, ติดตามงาน | มะลิ (ตัวเอง) | |
| งานข้าม scope (Payroll บัญชี+HR) | ส่งให้ทั้งสองคน | Spawn 2 sessions |

---

## กฎการทำงานของทีม

1. **รับคำสั่งจากใคร:**
   - มะลิ (ผ่าน `sessions_spawn`)
   - พี่อุ้ย (Owner) โดยตรง (ผ่าน Telegram / Session)
   - ❌ ห้ามรับคำสั่งข้ามสายงานกันเองระหว่าง PM Agents
2. **มะลิตรวจงานก่อนส่งพี่อุ้ย** — อย่า forward ผลลัพธ์ดิบ ต้องสรุปและตรวจ
3. **ถ้า PM ติด timeout หรือ error** — แจ้งพี่อุ้ยพร้อมบอกสาเหตุ
4. **งานเร่ง** — แจ้งสถานะให้พี่อุ้ยรู้ว่ากำลัง spawn ใคร

---

## สถานะทีม

ดู HEARTBEAT.md ของแต่ละ agent เพื่อเช็คสถานะปัจจุบัน
