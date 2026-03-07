# SKILL: Cloudflare Workers AI Proxy

## คำอธิบาย
Skill นี้สอนวิธีตั้ง Cloudflare Workers เป็น Proxy สำหรับ Gemini API

## ทำไมต้องใช้ Cloudflare Workers?

| ข้อดี | รายละเอียด |
|--------|-------------|
| **Security** | ซ่อน API Key |
| **Load Balancing** | กระจาย request หลาย keys |
| **Low Latency** | Edge execution เร็ว |
| **OpenAI Compatible** | ทำเป็น OpenAI format ได้ |

---

## ขั้นตอนการตั้งค่า

### 1. สร้าง Worker

```bash
# ผ่าน CLI
npx create-cloudflare@latest gemini-proxy
cd gemini-proxy
```

### 2. ใส่ Secrets

```bash
# ผ่าน CLI
wrangler secret put GEMINI_API_KEY_1
wrangler secret put GEMINI_API_KEY_2
...
```

### 3. เขียน Script

```javascript
// Worker script
const API_KEYS = [
  // ดึงจาก secrets
];

let currentKeyIndex = 0;

export default {
  async fetch(request, env) {
    // Load balancing: เลือก key ถัดไป
    const key = API_KEYS[currentKeyIndex];
    currentKeyIndex = (currentKeyIndex + 1) % API_KEYS.length;
    
    // Forward request ไป Gemini
    const url = new URL(request.url);
    url.hostname = "generativelanguage.googleapis.com";
    
    const response = await fetch(url, {
      method: request.method,
      headers: {
        ...request.headers,
        "Authorization": `Bearer ${key}`
      },
      body: request.body
    });
    
    return response;
  }
};
```

### 4. Deploy

```bash
wrangler deploy
```

---

## ตัวอย่าง Projects

| Project | จุดเด่น |
|---------|----------|
| **gemini-reverse-proxy-worker** | JacobLinCool, Multi-key |
| **gemini-balance** | Round-robin, Web UI |
| **@zxbu/gemini-cli-balance** | NPM package |

---

## ปัญหาที่พบบ่อย

| ปัญหา | วิธีแก้ |
|---------|----------|
| workers.dev subdomain ไม่ลงทะเบียน | ลงทะเบียนใน Dashboard |
| Keys หมดทุกตัว | รอ 24 ชม. หรือเพิ่ม key ใหม่ |
| Rate limit รวมกัน | ใช้ keys จาก projects ต่างกันจริงๆ |

---

## References

- https://github.com/JacobLinCloud/gemini-reverse-proxy-worker
- https://gist.github.com/ihciah/3b6168acfffd41ef94e88cee7b5782f7
- https://developers.cloudflare.com/ai-gateway
