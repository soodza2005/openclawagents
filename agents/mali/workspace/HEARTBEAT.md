# HEARTBEAT.md (Model Usage - ทุก 30 นาที)

# Heartbeat Tasks (ทุก 30 นาที)

## Task: ตรวจสอบ Model Usage

### MiniMax (Coding Plan)
- เปิด browser ไปที่ https://platform.minimax.io/user-center/payment/balance
- ดู Coding Plan → Current Usage
- บันทึก % ที่ใช้ไป

### GitHub Copilot
- เปิด browser ไปที่ https://github.com/settings/copilot
- ดู Usage → Premium requests %
- บันทึก % ที่ใช้ไป

### รายงานผล
ส่ง message แจ้งพี่อุ้ยทุกครั้งที่เช็ค ดังนี้:

```
📊 Model Usage Update

🤖 MiniMax M2.5: X% (5hr cycle)
💻 GitHub Copilot: X% (monthly)
```

ถ้า usage เกิน 80% → แจ้งเตือนพี่อุ้ยทันที!

---

# CRON: Pairing Requests (ทุก 1 ชม.)

## Task: ตรวจสอบ Pairing Requests

### 1. ตรวจสอบ Pairing Requests จาก CLI
```bash
openclaw pairing list telegram
```

### 2. ถ้ามี Pending Requests
- ดึงข้อมูล: pairing code, user ID, เวลา
- ส่ง message แจ้งพี่อุ้ย ดังนี้:

```
🚨 มีคนใหม่ทัก Agent!

📋 Code: [CODE]
👤 User: [user ID]
📱 Agent: [pm_accounting/pm_hrms]
⏰ เวลา: [timestamp]

พี่อุ้ยพิมพ์ "approve" ได้เลยค่ะ!
```

### 3. รอคำสั่งจากพี่อุ้ย

**ถ้าพี่อุ้ยพิมพ์ "approve":**
- รัน `openclaw pairing approve telegram <CODE>`
- แจ้งผลพี่อุ้ย: "✅ Approve เรียบร้อยค่ะ!"

**ถ้าพี่อุ้ยพิมพ์ "reject":**
- ไม่ต้องทำอะไร (ปฏิเสธ)
- แจ้งพี่อุ้ย: "❌ ปฏิเสธแล้วค่ะ"

### 4. บันทึก State
- เก็บ list ของ pending requests ไว้ใน `memory/heartbeat-state.json`
- เปรียบเทียบกับครั้งก่อน ถ้ามี request ใหม่ให้แจ้งพี่อุ้ย

---

# SELF-IMPROVEMENT: Background Research (ทุก heartbeat ที่ idle)

Run when idle (no active conversation 2+ hours, no urgent tasks pending).

Read `self-improvement/rules.md` and follow the SELF IMPROVEMENT CYCLE fully.
All rules and enforcement are defined there.
