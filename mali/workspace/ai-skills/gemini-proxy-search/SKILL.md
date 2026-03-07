# SKILL: Gemini Proxy Web Search

## คำอธิบาย
Skill นี้ช่วยให้ Mali สามารถค้นหาข้อมูลโดยใช้ Gemini API ผ่าน Cloudflare Worker Proxy

## Endpoint

```
Worker URL: https://falling-glitter-0817.soodza2005.workers.dev/v1beta/openai/chat/completions
```

## วิธีใช้

### 1. เรียกใช้ Gemini API ผ่าน Worker

```python
import requests
import json

def gemini_proxy_search(prompt: str, model: str = "gemini-2.0-flash"):
    """ค้นหาข้อมูลโดยใช้ Gemini API ผ่าน Worker Proxy"""
    
    # API Key (ตัวแรก)
    api_key = "AIzaSyAUUOCvcraF2XC4PIn-37ACTSXoDcAKMfM"
    
    # Endpoint
    url = "https://falling-glitter-0817.soodza2005.workers.dev/v1beta/openai/chat/completions"
    
    # Headers
    headers = {
        "Authorization": f"Bearer {api_key}",
        "Content-Type": "application/json"
    }
    
    # Body
    body = {
        "model": model,
        "messages": [
            {
                "role": "user",
                "content": prompt
            }
        ]
    }
    
    # Request
    response = requests.post(url, headers=headers, json=body)
    
    # Response
    if response.status_code == 200:
        result = response.json()
        return result["choices"][0]["message"]["content"]
    else:
        return f"Error: {response.status_code} - {response.text}"

# ตัวอย่างการใช้
result = gemini_proxy_search("What is AI in 2025?")
print(result)
```

### 2. ใช้ใน Terminal (curl)

```bash
curl -X POST "https://falling-glitter-0817.soodza2005.workers.dev/v1beta/openai/chat/completions" \
  -H "Authorization: Bearer AIzaSyAUUOCvcraF2XC4PIn-37ACTSXoDcAKMfM" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "gemini-2.0-flash",
    "messages": [{"role": "user", "content": "Hello!"}]
  }'
```

## Models ที่รองรับ

| Model | ความเร็ว | เหมาะกับ |
|-------|----------|-----------|
| gemini-2.0-flash | เร็ว | งานทั่วไป |
| gemini-2.5-flash | ปานกลาง | งานซับซ้อน |
| gemini-1.5-flash | เร็ว | งานง่าย |

## ข้อดีของ Worker Proxy

| ข้อดี | รายละเอียด |
|--------|-------------|
| **Load Balancing** | สลับ Keys อัตโนมัติ |
| **Failover** | Key หมด → ไป key ถัดไป |
| **Privacy** | ซ่อน API Keys |
| **Rate Limit** | รวม 11 Keys = 220 requests/day |

## Error Handling

```python
def search_with_retry(prompt: str, max_retries: int = 3):
    """ค้นหาพร้อม retry"""
    
    for i in range(max_retries):
        try:
            result = gemini_proxy_search(prompt)
            if not result.startswith("Error"):
                return result
        except Exception as e:
            print(f"Retry {i+1}/{max_retries}: {e}")
    
    return "Failed after 3 retries"

# ใช้งาน
result = search_with_retry("Tell me about AI trends 2025")
print(result)
```

## กรณี Key หมดทั้งหมด

ถ้า Keys ทั้งหมดหมด ระบบจะ return:
```
Error: 503 - All API keys exhausted.
```

**วิธีแก้:** รอประมาณ 24 ชั่วโมงให้ quota reset หรือเพิ่ม key ใหม่ใน Worker

## References
- Cloudflare Workers: https://workers.cloudflare.com
- Gemini API: https://ai.google.dev/docs
