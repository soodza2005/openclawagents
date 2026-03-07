---
name: notion
description: Interact with Notion via API.
---

# Notion Skill

จัดการ Notion pages และ databases ผ่าน API

## การใช้งาน

```bash
# ดู page
notion page "page-id"

# สร้าง page
notion new --database "database-id" --title "Title"

# ค้นหา
notion search "query"
```

## ติดตั้ง

```bash
# ติดตั้ง via npm
npm install -g notion-cli

# หรือใช้ official Notion API
```

## Authentication

ต้องมี Notion Integration Token
- ไปที่ https://www.notion.so/my-integrations
- สร้าง integration ใหม่
- เอา token มาใช้
