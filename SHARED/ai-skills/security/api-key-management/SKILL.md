# SKILL: API Key Management & Failover for AI Agents

## คำอธิบาย
Skill นี้ช่วยจัดการ API Keys หลายตัวสำหรับ AI Agents โดยมีระบบ Failover อัตโนมัติ

## ปัญหา
- API Key เดียวมี Rate Limit
- Key หมด → Service หยุด
- ต้องมี Backup Keys

## วิธีแก้ไข

### 1. การตั้งค่าหลาย Keys (OpenClaw)

```bash
# วิธีที่ 1: Comma-separated
GEMINI_API_KEYS="key1,key2,key3,key4"

# วิธีที่ 2: Numbered
GEMINI_API_KEY="key1"
GEMINI_API_KEY_1="key2"
GEMINI_API_KEY_2="key3"

# วิธีที่ 3: Override สูงสุด
OPENCLAW_LIVE_GEMINI_KEY="key_live"
```

### 2. การทำงานของ Failover

| Trigger | การทำงาน |
|---------|-----------|
| 429 (Rate Limit) | Auto ไป key ถัดไป |
| 401 (Unauthorized) | ไป key ถัดไป |
| Network Error | Retry ก่อน แล้วไป key ถัดไป |
| ทุก Key ล้มเหลว | Return error สุดท้าย |

### 3. การคำนวณ Quota

| Keys | Quota/Day |
|------|------------|
| 1 key | 20 requests |
| 5 keys | 100 requests |
| 10 keys | 200 requests |
| 11 keys | 220 requests |

### 4. Best Practices

#### สำหรับ Gemini
- ใช้หลาย Google Cloud Projects
- แต่ละ Project = 20 requests/day (Free Tier)
- รวม 10 keys = 200 requests/day

#### สำหรับ OpenAI
- ใช้ API Keys หลายตัว
- หรือใช้ OpenRouter สำหรับ Aggregation

#### สำหรับ General
- **Zero Trust** - ตรวจสอบทุก Request
- **Least Privilege** - ให้สิทธิ์เท่าที่จำเป็น
- **Automation** - หมุน Keys อัตโนมัติ
- **Monitoring** - เช็ค Usage สม่ำเสมอ

### 5. Load Balancing Patterns

| Pattern | คำอธิบาย |
|---------|-----------|
| **Round Robin** | ส่งต่อเรียง 1→2→3→1 |
| **Weighted** | Key ที่มี quota เยอะกว่า → ได้มากกว่า |
| **Priority** | ใช้ key แรกก่อน ถ้าหมดค่อยไป key ถัดไป |
| **Health Check** | เช็คก่อนว่า key ทำงานได้ |

## ตัวอย่าง: OpenClaw Config

```json
{
  "tools": {
    "web": {
      "search": {
        "enabled": true,
        "provider": "gemini",
        "gemini": {
          "model": "gemini-2.5-flash"
        }
      }
    }
  }
}
```

## Environment Variables

```bash
# OpenClaw อ่านจาก:
# 1. Process Environment
# 2. .env ใน folder ที่รัน
# 3. ~/.openclaw/.env
# 4. openclaw.json (env block)
```

## ข้อควรรู้

1. **Failover เกิดขึ้นเมื่อ:**
   - HTTP 429 (Rate Limit)
   - Error message มี "rate_limit", "quota", "exhausted"

2. **Failover ไม่เกิดเมื่อ:**
   - Invalid API Key (401)
   - Network Timeout

3. **ควรมี:**
   - Keys อย่างน้อย 3-5 ตัว
   - Monitoring ดูว่า key ไหนถูกใช้

## References
- https://docs.openclaw.ai/concepts/model-providers
- https://docs.openclaw.ai/help/environment
