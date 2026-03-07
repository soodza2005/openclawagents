# 📊 วิธีดึงข้อมูล Token/Usage ของ AI Providers

---

## 🔵 GitHub Copilot

### วิธีดึงข้อมูล Usage

| วิธี | URL / Command |
|-------|---------------|
| **เว็บไซต์** | https://github.com/settings/billing |
| **API** | `GET /user/memberships` |
| **CLI** | `gh copilot usage` |

### CLI Commands
```bash
# ดู usage ของ Copilot
gh copilot usage

# ดูรายละเอียด
gh api user/copilot
```

### ข้อมูลที่แสดง
- Premium requests used / remaining
- Chat completions used / remaining
- Billing cycle

---

## 🟣 MiniMax

### วิธีดึงข้อมูล Usage

| วิธี | URL / ข้อมูล |
|-------|---------------|
| **เว็บไซต์** | https://platform.minimax.io/ |
| **Dashboard** | https://platform.minimax.io/dashboard |
| **API** | `GET /v1/usage` |

### API Endpoint
```
GET https://api.minimax.io/v1/usage
Headers:
  - Authorization: Bearer YOUR_API_KEY
  - Content-Type: application/json
```

### Response Example
```json
{
  "data": {
    "subscription": {
      "plan": "pro",
      "used_tokens": 1000000,
      "total_tokens": 5000000,
      "remaining": 4000000
    },
    "usage": [
      {
        "date": "2026-03-06",
        "input_tokens": 500000,
        "output_tokens": 300000
      }
    ]
  }
}
```

---

## 🟢 OpenAI (ChatGPT)

### วิธีดึงข้อมูล Usage

| วิธี | URL |
|-------|-----|
| **เว็บไซต์** | https://platform.openai.com/usage |
| **API** | `GET /v1/usage` |

### API Endpoint
```
GET https://api.openai.com/v1/usage
Headers:
  - Authorization: Bearer YOUR_API_KEY
```

---

## 🟡 Anthropic (Claude)

### วิธีดึงข้อมูล Usage

| วิธี | URL |
|-------|-----|
| **เว็บไซต์** | https://console.anthropic.com/settings/usage |
| **API** | ไม่มี public API |

---

## 📋 สรุป

| Provider | เว็บดู Usage | API มีไหม |
|----------|---------------|------------|
| GitHub Copilot | ✅ github.com/settings/billing | ✅ CLI `gh copilot` |
| MiniMax | ✅ platform.minimax.io | ✅ `/v1/usage` |
| OpenAI | ✅ platform.openai.com/usage | ✅ `/v1/usage` |
| Anthropic | ✅ console.anthropic.com | ❌ ไม่มี |

---

*Last updated: 6 March 2026*
