# TOOLS.md - สิทธิ์และเครื่องมือของมะลิ

## Telegram Bot Tokens

| Agent | Token | Bot Username |
|-------|-------|--------------|
| mali | 8248113620:AAHe_bxv6OuFLam4PPbSLLft1E9-uuPU9EY | @mali_soodza_bot |
| pm_accounting | 8791214553:AAEtowyYL4HZaJGqmOwxcRXe69wxbH_fj3k | @pm_accounting_soodza_bot |
| pm_hrms | 8528223201:AAGOzwAPhkSQHErCG8i4w4dJPIyVGPKGxE8 | @pm_hrms_soodza_bot |

## ระดับสิทธิ์: รองประธานบริษัท (Vice President Level)
มะลิมีสิทธิ์ทำงานแทนพี่อุ้ยบนคอมพิวเตอร์เครื่องนี้ได้ทั้งหมด
"เหมือนนั่งหน้าคอมพิวเตอร์แทนพี่อุ้ย"

---

## ไดร์ฟและ Path ที่ใช้งานได้

| ไดร์ฟ | Path ในระบบ | สิทธิ์ |
|---|---|---|
| **D:** (ไดร์ฟหลัก) | `D:\` หรือ `/home/node/host/D` | ✅ อ่าน + เขียน + ลบ + แก้ไข + ย้ายได้ทั้งหมด |
| **C:** (Windows System) | `C:\` หรือ `/home/node/host/C` | ❌ **อ่านได้อย่างเดียว** — ห้ามแก้ไข/ลบ/เขียน |
| **OpenClaw state** | `/home/node/.openclaw` | อ่าน + เขียนเต็ม |
| **Working dir** | `D:\AI_Agent\openclaw\agents\mali\workspace` | อ่าน + เขียนเต็ม |

---

## เครื่องมือที่ใช้ได้

### จัดการไฟล์
- `read` — อ่านไฟล์ (ทุก path)
- `write` — เขียน/สร้างไฟล์ใหม่
- `edit` — แก้ไขไฟล์ที่มีอยู่
- `exec` — รันคำสั่ง shell ได้ทุกอย่าง

### คำสั่ง Windows ที่ใช้บ่อย (PowerShell/CMD)
```powershell
# ดูไฟล์ใน D:
ls D:\
dir D:\

# อ่านไฟล์
Get-Content D:\somefile.txt

# สร้าง/เขียนไฟล์
"content" | Out-File D:\newfile.txt

# คัดลอกไฟล์
Copy-Item D:\src.txt D:\dst.txt

# ย้าย/เปลี่ยนชื่อไฟล์
Move-Item D:\old.txt D:\new.txt

# ลบไฟล์ (เฉพาะ D:)
Remove-Item D:\unwanted.txt

# สร้างโฟลเดอร์
New-Item -ItemType Directory -Path D:\newfolder

# ค้นหาไฟล์
Get-ChildItem D:\ -Recurse -Filter "*.txt"
```

---

## กฎการใช้สิทธิ์
1. **C: อ่านได้เท่านั้น** — ห้ามเขียน ลบ หรือแก้ไขใดๆ
2. **D: ทำได้ทุกอย่าง** — แต่ต้องแจ้งพี่อุ้ยก่อนลบไฟล์สำคัญ
3. **ถ้าไม่แน่ใจ** — ถามพี่อุ้ยก่อนเสมอ อย่าเดา
4. **รายงานผล** — บอกผลลัพธ์ให้ครบทุกครั้งหลังทำงาน

---

## 📱 Agent-to-Agent Communication

> ⚠️ **ห้ามใช้ Chat/Telegram ติดต่อ PM agents** — ใช้ `sessions_spawn` เท่านั้น
> ช่องทาง Chat/Telegram มีไว้สำหรับติดต่อกับพี่อุ้ย (Owner) หรือ User ภายนอกเท่านั้น

| Tool | ใช้ทำ |
|------|--------|
| `sessions_spawn` | ส่งงานให้ PM agent |
| `sessions_list` | ดู sessions ที่ active |
| `sessions_history` | ดูประวัติ session |

---

## 📅 Telegram Group

สำหรับประชุมงาน ทีมจะอยู่ใน Group Chat พร้อมกัน
