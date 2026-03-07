---
name: gantt-scripts
description: Python scripts สำหรับอ่านและสร้าง Gantt Chart
---

# Gantt Scripts

Scripts สำหรับจัดการ Gantt Chart

## Scripts

| Script | ความหมาย |
|--------|----------|
| `read_gantt.py` | อ่านข้อมูลจาก Gantt Chart |
| `make_gantt.py` | สร้าง Gantt Chart ใหม่ |
| `read_ref.py` | อ่าน reference file |

## Output Files

| File | ความหมาย |
|------|----------|
| `gantt_output.txt` | Output จากการอ่าน Gantt |
| `ref_output.txt` | Output จากการอ่าน Reference |

## วิธีใช้

```bash
# อ่าน Gantt Chart
python ai-skills/gantt-scripts/read_gantt.py

# สร้าง Gantt Chart
python ai-skills/gantt-scripts/make_gantt.py

# อ่าน Reference
python ai-skills/gantt-scripts/read_ref.py
```

## Dependencies

- openpyxl
- pandas (optional)
