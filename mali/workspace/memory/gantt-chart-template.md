# Knowledge: Gantt Chart Template (Updated)

> Excel Gantt Chart Template สำหรับ Project Management - Version 2

---

## ไฟล์
- **ชื่อ:** `Nathalin_Gantt_2025.xlsx`
- **ที่:** Workspace ของมะลิ

---

## โครงสร้าง

### Sheet 1: Data
| คอลัมน์ | ข้อมูล |
|---------|----------|
| A | Week (W1-W52) |
| B | Start (วันเริ่มต้นสัปดาห์) |
| C | End (วันสิ้นสุดสัปดาห์) |

### Sheet 2: Gantt Chart
| คอลัมน์ | ข้อมูล |
|---------|----------|
| A | WBS Number |
| B | Task Title (รวมชื่อ sub-task) |
| C | Owner (ผู้รับผิดชอบ) |
| D | Start Date |
| E | Due Date |
| F | Duration |
| G | % Complete |
| H-BC | Weekly Timeline (dd/mm) |

---

## 5 Projects ตามที่กำหนด

| # | Project | ช่วงเวลา | Sub-tasks |
|---|---------|----------|-----------|
| 1 | Intranet JD (ปรับแก้) | 01/01/2025 - 10/02/2025 | 1.1-1.3 |
| 2 | Report Financial | 15/01/2025 - 31/05/2025 | 2.1-2.4 |
| 3 | Financial Correction | 01/05/2025 - 30/07/2025 | 3.1-3.5 |
| 4 | SitePlan (แผน WFH) | 15/07/2025 - 30/07/2025 | 4.1-4.3 |
| 5 | Closeaccount | 15/07/2025 - 31/12/2025 | 5.1-5.7 |

---

## Sub-tasks Details

### 1. Intranet JD (ปรับแก้)
- 1.1 สร้าง Setup เพื่อทำ auto generate Prefix Code
- 1.2 สร้าง Setup Main Job
- 1.3 ปรับแก้หน้า Menu Main Job manage

### 2. Report Financial
- 2.1 เก็บข้อมูล
- 2.2 Report P&L
- 2.3 Report BS
- 2.4 Power point Report

### 3. Financial Correction
- 3.1 เก็บข้อมูล
- 3.2 plan project
- 3.3 สร้างหน้า รายงานข้อมูลดิบ Fin Dimension
- 3.4 สร้างหน้า ตรวจ/ปรับปรุง Fin Dimension App
- 3.5 สร้างหน้า สถานะการปิดบัญชี

### 4. SitePlan (แผน WFH)
- 4.1 หน้าจัดการแผน WFH
- 4.2 Dash Board
- 4.3 ปรับแก้

### 5. Closeaccount
- 5.1 เก็บข้อมูล
- 5.2 Plan แผนงาน
- 5.3 Raw DATA
- 5.4 MR Report :Profit & Loss Report
- 5.5 MR Report :Balance Sheet Report
- 5.6 MR Report :Trial Balance Report
- 5.7 MR Report :Standart Report

---

## วิธีใช้

### 1. แก้ไขวันที่
- แก้ไขในคอลัมน์ **START DATE (D)** และ **DUE DATE (E)**
- ใช้ **Conditional Formatting** ทำให้สีอัปเดตอัตโนมัติ

### 2. เพิ่ม Task ใหม่
- เพิ่มแถวใหม่ใน Gantt Chart
- ใส่ WBS, Task, Owner, Start, Due

### 3. สีของ Project
| Project | สี |
|---------|-----|
| 1. Intranet JD | 🟢 เขียว |
| 2. Report Financial | 🔵 น้ำเงิน |
| 3. Financial Correction | 🟠 ส้ม |
| 4. SitePlan | 🟣 ม่วง |
| 5. Closeaccount | 🔷 ฟ้าอ่อน |

---

## ฟอร์มูลาที่ใช้

- **Duration:** `=E-D+1` (คำนวณวันอัตโนมัติ)
- **Conditional Formatting:** `AND($D<=Data!$C, $E>=Data!$B)` เพื่อแสดงสีตามช่วงวัน

---

*Source: สร้างโดยมะลิเอง*
*Last updated: 6 March 2026*
