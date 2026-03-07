---
name: gemini
description: Gemini CLI for one-shot Q&A, summaries, and code generation.
---

# Gemini CLI

ใช้ Gemini AI ผ่าน command line

## การใช้งาน

```bash
gemini "คำถามหรือ prompt"
gemini --model <model-name> "prompt"
gemini --output-format json "Return JSON"
```

## ติดตั้ง

```bash
# ติดตั้งผ่าน npm
npm install -g gemini-cli

# หรือ brew
brew install gemini-cli
```

## หมายเหตุ

- ถ้าต้อง login ให้รัน `gemini` ครั้งแรกและทำตามขั้นตอน
- ใช้ --model เพื่อเลือก model
