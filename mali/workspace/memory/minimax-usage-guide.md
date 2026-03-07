# 📊 MiniMax Usage Tracker Guide

---

## วิธีดึงข้อมูล MiniMax Usage

### 1. จาก MiniMax Console
- **Path:** MiniMax Console → Billing → Usage
- **ข้อมูลที่แสดง:**
  - จำนวน tokens
  - จำนวน requests
  - ค่าใช้จ่ายรวม
- **หมายเหตุ:** บาง account จะเห็นแค่ balance/quota

### 2. จาก API Response Header
```python
import requests

response = requests.post(
    "https://api.minimax.chat/v1/text/chatcompletion",
    headers={
        "Authorization": "Bearer YOUR_API_KEY",
        "Content-Type": "application/json"
    },
    json={
        "model": "abab6.5-chat",
        "messages": [{"role": "user", "content": "hello"}]
    }
)

print(response.headers)
```

**Headers ที่ได้:**
- `X-RateLimit-Limit` - จำนวน limit
- `X-RateLimit-Remaining` - ที่เหลือ
- `X-RateLimit-Reset` - เวลา reset

### 3. Log Usage เอง (วิธีที่ Dev ใช้)
เก็บ usage ด้วยตัวเอง:
- request count
- token usage
- model ที่ใช้
- cost estimate

**Schema:**
```
usage_log
- timestamp
- model
- input_tokens
- output_tokens
- total_tokens
- cost_estimate
```

---

## 💡 แนะนำ: ทำ Usage Tracker กลาง

### Architecture:
```
Agent A (mali)
Agent B (ลูน่า)  →  Usage Logger  →  PostgreSQL  →  Grafana Dashboard
Agent C (ไอริส)
```

### ข้อดี:
- ดู cost แบบ real-time
- ใช้กับหลาย agent ได้
- เก็บประวัติย้อนหลัง

---

*Last updated: 6 March 2026*
