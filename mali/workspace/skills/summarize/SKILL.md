---
name: summarize
description: Summarize or extract text/transcripts from URLs, podcasts, and local files.
---

# Summarize

CLI สำหรับสรุป URLs, ไฟล์, และ YouTube

## การใช้งาน

```bash
# สรุป URL
summarize "https://example.com"

# Summarize YouTube
summarize "https://youtube.com/watch?v=xxx" --youtube auto

# Extract transcript only
summarize "https://youtube.com/watch?v=xxx" --youtube auto --extract-only

# ไฟล์ PDF
summarize "/path/to/file.pdf"
```

## ติดตั้ง

```bash
brew install steipete/tap/summarize
```

## API Keys

ตั้งค่า API key:
- `OPENAI_API_KEY`
- `ANTHROPIC_API_KEY`
- `GEMINI_API_KEY`
- `XAI_API_KEY`
