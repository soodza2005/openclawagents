---
name: gantt-chart
description: สร้างและจัดการ Gantt Chart สำหรับ Project Management ใช้เมื่อต้องการสร้าง timeline หรือติดตามความคืบหน้าของโปรเจกต์
---

# Gantt Chart Skill

ใช้สำหรับสร้างและจัดการ Gantt Chart สำหรับ Project Management

## ไฟล์ที่มี

```
gantt-chart/
├── Nathalin_Gantt_2025.xlsx    # Gantt Chart หลัก
├── Nathalin_Gantt_2025_ref.xlsx # Reference version
└── Nathalin_Project_Timeline_2025.xlsx # Timeline แบบย่อ
```

## Sheets ในไฟล์

### Nathalin_Gantt_2025.xlsx
- **Data** - ข้อมูลโปรเจกต์
- **Gantt Chart** - กราฟ timeline

### Nathalin_Gantt_2025_ref.xlsx
- **Gantt Chart** - กราฟ timeline
- **Data** - ข้อมูลโปรเจกต์

### Nathalin_Project_Timeline_2025.xlsx
- **Gantt Chart** - Timeline แบบย่อ

## วิธีใช้

### อ่านข้อมูล Gantt Chart
```python
import openpyxl

# อ่านไฟล์
wb = openpyxl.load_workbook('ai-skills/gantt-chart/Nathalin_Gantt_2025.xlsx')

# ดู sheets
print(wb.sheetnames)

# อ่านข้อมูล
ws = wb['Data']
for row in ws.iter_rows(max_row=10, values_only=True):
    print(row)
```

### แก้ไขข้อมูล
- แก้ไขใน sheet "Data"
- Gantt Chart จะ auto-update

## Template Fields

| Field | ความหมาย |
|-------|----------|
| WBS NUMBER | หมายเลขโปรเจกต์ |
| TASK TITLE | ชื่องาน |
| TASK OWNER | ผู้รับผิดชอบ |
| START DATE | วันเริ่ม |
| DUE DATE | วันส่ง |
| DURATION | ระยะเวลา (วัน) |
| PCT OF TASK COMPLETED | % ที่เสร็จแล้ว |

## หมายเหตุ

- ใช้ Python + openpyxl สำหรับอ่าน/เขียนไฟล์
- วันที่ใช้ format: YYYY-MM-DD
- Gantt Chart auto-update ตามวันที่ใน Data sheet
