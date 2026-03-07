# การระบุตัวตนในระบบ Multi-Agent (User Identification)

> สรุปการวิจัยเกี่ยวกับวิธีระบุตัวตนผู้ใช้ในระบบ AI Assistant และ Multi-Agent

---

## 🔍 ปัญหา: ลูน่าสับสนระหว่างพี่อุ้ยกับเต้

**สาเหตุ:** เมื่อคนสองคน (พี่อุ้ย + เต้) คุยกับ Agent เดียวกันผ่าน Telegram Bot เดียวกัน 
→ Agent ไม่สามารถแยกได้ว่าใครเป็นใคร → ใช้ context ของคนก่อนผิด

---

## 🛠️ วิธีแก้ไขใน OpenClaw

### 1. Session Isolation (แยก Session ตาม Sender)

```json5
{
  session: { dmScope: "per-channel-peer" }
}
```

**Options:**
| dmScope | พฤติกรรม |
|---------|----------|
| `main` | ทุก DM รวมเป็น session เดียว (ปัญหา!) |
| `per-channel-peer` | แยก session ตาม sender แต่ละคน ✅ |
| `per-account-channel-peer` | แยกตาม account + channel + sender |

### 2. Allowlist (ระบุ User ID ที่อนุญาต)

```json5
{
  channels: {
    telegram: {
      dmPolicy: "allowlist",
      allowFrom: ["123456789", "987654321"]  // Telegram User IDs
    }
  }
}
```

**วิธีหา Telegram User ID:**
- ส่ง DM ให้ Bot → ดูใน `openclaw logs`
- หรือ forward ข้อความไป @userinfobot

### 3. Bindings (Route ไป Agent ตาม Sender)

```json5
{
  bindings: [
    {
      agentId: "pm_accounting",
      match: { channel: "telegram", peer: { kind: "direct", id: "123456789" } }
    }
  ]
}
```

### 4. Per-Agent Workspace (แยก Workspace ชัดเจน)

```json5
{
  agents: {
    list: [
      { id: "main", workspace: "~/.openclaw/workspace-main" },
      { id: "toey", workspace: "~/.openclaw/workspace-toey" }
    ]
  }
}
```

---

## 🌍 วิธีของระบบอื่นๆ

### ChatGPT / Claude (Anthropic)

| วิธี | รายละเอียด |
|------|------------|
| **Conversation ID** | แยก conversation ตาม thread |
| **User ID** | ต้อง login เพื่อระบุตัวตน |
| **Team/Organization** | แยก workspace ตาม org |

### Claude Code (CLI)

| วิธี | รายละเอียด |
|------|------------|
| **Project-based** | แยกตาม project/folder |
| **--print flag** | Interactive vs non-interactive |
| **Session file** | บันทึก session แยกไฟล์ |

### Voiceflow / Dialogflow

| วิธี | รายละเอียด |
|------|------------|
| **Session ID** | แยก session ตาม user |
| **User Attributes** | เก็บ user profile แยก |
| **Agent Isolation** | แยก agent ต่างกัน |

### Microsoft Copilot

| วิธี | รายละเอียด |
|------|------------|
| **Microsoft Entra ID** | Login ด้วย corporate account |
| **Tenant ID** | แยกตาม organization |
| **Channel bindings** | Teams, Discord, etc. |

---

## 📋 แนวทางแก้ไขสำหรับลูน่า

### ทางเลือกที่ 1: แยก Telegram Bot (แนะนำ)

สร้าง Bot ใหม่สำหรับเต้ → แยก agent ให้ชัดเจน

```json5
{
  channels: {
    telegram: {
      accounts: {
        main: { botToken: "..." },
        toey: { botToken: "..." }
      }
    }
  }
}
```

### ทางเลือกที่ 2: ใช้ dmScope + Allowlist

```json5
{
  session: { dmScope: "per-channel-peer" },
  channels: {
    telegram: {
      dmPolicy: "allowlist",
      allowFrom: ["พี่อุ้ย_ID", "เต้_ID"]
    }
  }
}
```

### ทางเลือกที่ 3: ใช้ Identity Confirmation

เพิ่มขั้นตอนยืนยันตัวตนก่อนทำงาน:
- ถามชื่อ/รหัส
- ใช้ PIN/Password
- ตรวจสอบ keyword

---

## 🎯 สรุป: Best Practice

| Priority | วิธี | เหมาะกับ |
|----------|------|----------|
| 🔴 สูง | `dmScope: "per-channel-peer"` | ทุกกรณี |
| 🔴 สูง | ใช้ allowFrom กำหนด ID | จำกัดผู้ใช้ |
| 🟡 กลาง | แยก Bot/Account | หลายคน |
| 🟢 ต่ำ | Identity confirmation | ความปลอดภัยสูง |

---

*Updated: 6 March 2026*
