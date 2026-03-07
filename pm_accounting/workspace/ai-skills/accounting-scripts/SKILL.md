---
name: accounting-scripts
description: Scripts สำหรับงานบัญชี GL, AP, AR, Financial Statements
---

# Accounting Scripts

Scripts สำหรับงานบัญชีของ Nathalin

## Scripts

| Script | ความหมาย |
|--------|----------|
| `create_excel.ps1` | สร้าง Excel report |
| `export_excel.ps1` | Export ข้อมูลเป็น Excel |
| `get_all_balances.ps1` | ดึงยอดคงเหลือทั้งหมด |
| `get_balance_sheet.ps1` | ดึง Balance Sheet |
| `get_nat_journal.ps1` | ดึง Journal ของ NAT |

## Data Files

| File | ความหมาย |
|------|----------|
| `PL_NAT_Sep2025.xlsx` | P&L Report Sep 2025 |
| `PL_NAT_Sep2025.csv` | P&L Report Sep 2025 (CSV) |

## วิธีใช้

```powershell
# Run PowerShell scripts
powershell ai-skills/accounting-scripts/get_balance_sheet.ps1
powershell ai-skills/accounting-scripts/get_all_balances.ps1
```

## Dependencies

- PowerShell
- Excel (สำหรับ export)
