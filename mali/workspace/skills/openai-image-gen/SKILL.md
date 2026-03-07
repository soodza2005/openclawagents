---
name: openai-image-gen
description: สร้างรูปภาพด้วย OpenAI Images API
---

# 🖼️ OpenAI Image Gen

สร้างรูปภาพด้วย OpenAI (DALL-E, GPT Image)

## การใช้งาน

```bash
# สร้างรูปจาก prompt
python3 {baseDir}/scripts/gen.py --prompt "รายละเอียดรูปที่ต้องการ" --count 1

# ขนาด
--size 1024x1024
--size 1792x1024
--size 1024x1796

# คุณภาพ
--quality high
--quality hd

# Model
--model gpt-image-1
--model dall-e-3
--model dall-e-2
```

## ตัวอย่าง

```bash
# รูปแมวน่ารัก
python3 /app/skills/openai-image-gen/scripts/gen.py --prompt "cute kitten playing with yarn" --count 1

# ภาพ landscape
python3 /app/skills/openai-image-gen/scripts/gen.py --prompt "serene mountain landscape at sunset" --size 1792x1024 --quality hd
```

## หมายเหตุ

- ต้องมี `OPENAI_API_KEY` ใน environment
- Image generation ใช้เวลานาน ควรตั้ง timeout สูงกว่า 30 วินาที
- DALL-E 3 สร้างได้ทีละ 1 รูป
