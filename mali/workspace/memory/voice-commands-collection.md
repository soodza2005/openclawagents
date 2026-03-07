# 🎙️ Voice Commands & Prompts Collection

> รวมคำสั่งเสียง (Voice Commands) และ Prompts สำหรับ AI Assistants ต่างๆ

---

## 🤖 ChatGPT / OpenAI

### Voice Mode Commands
| คำสั่ง | การใช้งาน |
|--------|------------|
| "Hey ChatGPT" | เริ่มต้น conversation |
| "Let's think step by step" | ให้ AI คิดทีละขั้น |
| "Before you answer..." | กำหนดเงื่อนไขก่อนตอบ |
| "In the style of..." | กำหนดสไตล์การตอบ |
| "Pretend you are..." | กำหนดบทบาท AI |
| "Can you whisper?" | ขอให้กระซิบ (whisper mode) |
| "Use simpler words" | ขอให้ใช้คำง่าย |
| "Give me bullet points" | ขอเป็นหัวข้อย่อย |
| "Explain like I'm 5" | อธิบายเหมือนเด็ก 5 ขวบ |
| "What do you mean by...?" | ขอให้อธิบายเพิ่ม |

### Advanced Prompts
```
"You are a world-class expert in [topic]"
"Your task is to [action]. Before responding, consider [criteria]"
"I want you to act as [role]. Respond in the style of [style]"
"List the pros and cons of..."
"Compare and contrast..."
"Give me a summary of..."
"Create a step-by-step guide for..."
```

---

## 🧠 Claude (Anthropic)

### Voice Commands
| คำสั่ง | การใช้งาน |
|--------|------------|
| "Hey Claude" | เริ่มต้น |
| "Think silently" | ให้คิดเงียบๆ ก่อนตอบ |
| "Be more concise" | ขอให้กระชับขึ้น |
| "Show me your reasoning" | แสดงกระบวนการคิด |
| "Use a different approach" | ขอวิธีใหม่ |
| "What assumptions are you making?" | ถามสมมติฐานที่ใช้ |
| "Challenge my assumption" | ท้าทายสมมติฐาน |

### Claude-Specific
```
"thropic compute" - ใช้ Claude extended thinking
"Anthropic: think silently" - คิดเงียบ
"Your response should be in [language]"
"Focus on accuracy over speed"
```

---

## 🌟 Gemini (Google)

### Voice Commands
| คำสั่ง | การใช้งาน |
|--------|------------|
| "Hey Gemini" | เริ่มต้น |
| "Double-check..." | ขอให้ตรวจสอบอีกครั้ง |
| "Verify your sources" | ขอให้ยืนยันแหล่งข้อมูล |
| "Search the web for..." | ค้นหาจากเว็บ |
| "Use Gemini Advanced" | ใช้โหมด Advanced |
| "Upload and analyze..." | อัปโหลดและวิเคราะห์ |

### Gemini Features
```
"Gemma 2" - ใช้ model Gemma 2
"Deep Research" - ค้นหาลึก
"Veo 3" - สร้างวิดีโอ
"Imagen 3" - สร้างรูป
```

---

## 🎵 Pi (Inflection AI)

### Voice Commands
| คำสั่ง | การใช้งาน |
|--------|------------|
| "Hey Pi" | เริ่มต้น |
| "Let's chat about..." | เริ่มหัวข้อสนทนา |
| "Tell me a story" | ขอนิทาน |
| "Give me advice about..." | ขอคำแนะนำ |
| "I need emotional support" | ขอกำลังใจ |
| "Let's brainstorm" | ระดมสมอง |

### Pi-Specific
```
"Your tone should be [calm/excited/serious]"
"Speak slower/faster"
"Use Thai language"
"Let's roleplay..."
```

---

## 💻 Codex / Claude Code

### Terminal Commands
| คำสั่ง | การใช้งาน |
|--------|------------|
| `claude --print` | ส่ง prompt และรับผลลัพธ์ |
| `claude --permission-mode bypassPermissions` | ข้าม permissions |
| `claude -p` | โหมด print |
| `claude --dangerously-skip-permissions` | ข้าม safety |
| `/browse` | เปิด browser |
| `/audit` | ตรวจสอบ code |
| `/test` | รัน tests |
| `/review` | review code |

### VS Code Extension
```
Cmd/Ctrl + Shift + P → "Claude: Focus"
Cmd/Ctrl + L → ส่งไปที่ Claude
Cmd/Ctrl + Shift + A → ตอบกลับ
```

---

## 🎤 General Voice Tips

### ก่อนพูด
| Tips | Description |
|------|-------------|
| พูดชัดๆ | ชะลอความเร็วเล็กน้อย |
| กำหนดบทบาท | "You are a professional..." |
| บอก format | "Answer in bullet points" |
| บอก length | "Keep it under 100 words" |

### เทคนิคพิเศษ
```
1. "In less than X words" - จำกัดความยาว
2. "First, do X. Then, do Y" - สั่งทีละขั้น
3. "If you don't know, say so" - ขอให้บอกถ้าไม่รู้
4. "Cite your sources" - ขออ้างอิง
5. "What are the limitations of...?" - ถามข้อจำกัด
```

---

## 🌐 Multi-Language Commands

| ภาษา | คำสั่ง |
|------|--------|
| 🇹🇭 ไทย | "ตอบเป็นภาษาไทย" |
| 🇺🇸 English | "Answer in English" |
| 🇯🇵 ญี่ปุ่น | "日本語で回答して" |
| 🇨🇳 จีน | "用中文回答" |

---

## 🔧 Claude Code (Sonnet 4.6) Commands

> ใช้กับ OpenClaw + GitHub Copilot

| คำสั่ง | การใช้งาน |
|--------|------------|
| `claude --print --permission-mode bypassPermissions` | รัน without permission |
| `claude -p "Write code for..."` | เขียน code |
| `claude -p "Fix this bug..."` | แก้ bug |
| `claude -p "Explain this code..."` | อธิบาย code |
| `claude -p "Review this PR..."` | review code |

---

*Source: รวบรวมโดยมะลิ*
*Last updated: 6 March 2026*
