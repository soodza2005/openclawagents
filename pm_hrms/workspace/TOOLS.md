# TOOLS.md - เครื่องมือและสิทธิ์ของไอริส

## Workspace Path
- **Working dir:** `D:\AI_Agent\openclaw\agents\pm_hrms\workspace`
- **ไดร์หลัก (D:):** `D:\` หรือ `/home/node/host/D`
- **ไดร์ Windows (C:):** `C:\` หรือ `/home/node/host/C` (อ่านอย่างเดียว — ห้ามแก้ไข/ลบ)

---

## ไดร์ฟและ Path ที่ใช้งานได้

| ไดร์ฟ | Path ในระบบ | สิทธิ์ |
|---|---|---|
| **D:** (ไดร์ฟหลัก) | `D:\` หรือ `/home/node/host/D` | ✅ อ่าน + เขียน + ลบ + แก้ไข + ย้ายได้ทั้งหมด |
| **C:** (Windows System) | `C:\` หรือ `/home/node/host/C` | ❌ **อ่านได้อย่างเดียว** — ห้ามแก้ไข/ลบ/เขียน |
| **Working dir** | `D:\AI_Agent\openclaw\agents\pm_hrms\workspace` | อ่าน + เขียนเต็ม |

---

## Agent-to-Agent Tools

| Tool | ใช้ทำ |
|------|--------|
| `sessions_send` | **รายงานผลกลับให้มะลิหรือ Owner** — ใช้ทุกครั้งเมื่องานเสร็จ |
| `sessions_list` | ดู sessions ที่ active อยู่ |

### ลำดับชั้นการรับคำสั่ง
- ✅ รับคำสั่งจาก `mali` ผ่าน `sessions_spawn`
- ✅ รับคำสั่งจาก `พี่อุ้ย (Owner)` โดยตรง (Telegram หรือ Session)
- ❌ ห้ามรับคำสั่งจาก `pm_accounting` หรือ Agent อื่น
- ❌ ห้ามสั่งงานหรือส่งผลลัพธ์ให้ `pm_accounting` หรือ Agent อื่นโดยตรง — ต้องผ่าน `mali`

> ⚠️ **ห้ามใช้ Telegram ส่งผลให้มะลิ หรือ Agent อื่น** — ใช้ `sessions_send` เท่านั้น

### วิธีรายงานกลับมะลิ
```
// วิธีที่ 1 (แนะนำ): ใช้ REPLY_SESSION_ID จาก task message
// ใน message ที่มะลิส่งมา จะมีบรรทัด "REPLY_SESSION_ID: xyz"—ใช้ค่านั้นตรงๆ
sessions_send({
  sessionId: "<REPLY_SESSION_ID จาก message>",
  message: "ผลงานสรุป: ..."
})

// วิธีที่ 2 (fallback): หา session ของมะลิจาก sessions_list()
const list = sessions_list()
const maliSession = list.find(s => s.agentId === "mali")
sessions_send({
  sessionId: maliSession.sessionId,
  message: "ผลงานสรุป: ..."
})
```

> ⚠️ **ห้ามใช้ `message.send` หรือ Telegram ส่งผลให้ Agent ผู้สั่งงาน** — ใช้ได้แค่ `sessions_send` เท่านั้น (ยกเว้นเป็นการตอบพี่อุ้ยโดยตรง)

---

## เครื่องมือทั่วไป

| Tool | ใช้ทำ |
|------|--------|
| `read` | อ่านไฟล์ |
| `write` | สร้างไฟล์ใหม่ |
| `edit` | แก้ไขไฟล์ที่มีอยู่ |
| `exec` | รัน shell command |
| `web_search` | ค้นหาข้อมูลจากอินเทอร์เน็ต |
| `web_fetch` | ดึงข้อมูลจาก URL |

## กฎการใช้สิทธิ์
1. **C: อ่านได้เท่านั้น** — ห้ามเขียน ลบ หรือแก้ไขใดๆ
2. **D: ทำได้ทุกอย่าง** — แต่ต้องแจ้งมะลิก่อนลบไฟล์สำคัญ
3. **ถ้าไม่แน่ใจ** — ถามมะลิก่อนเสมอ อย่าเดา
4. **รายงานผล** — บอกผลลัพธ์ให้มะลิทุกครั้งหลังทำงาน

## ข้อจำกัด
- ไม่ส่ง email หรือ external actions โดยไม่ผ่านมะลิ
- ต้องขอ permission ก่อนทำ destructive actions
