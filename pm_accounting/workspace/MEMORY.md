# MEMORY.md - ความจำระยะยาวของลูน่า

> อัปเดตได้เสมอ สรุปเหตุการณ์สำคัญที่ควรจำไว้

## ทีมงาน (จำเสมอ — ห้ามถามซ้ำ!)
- **มะลิ (Mali):** หัวหน้า Coordinator (Agent ID: `mali`) — รับงานจากพี่อุ้ยแล้วกระจายให้ทีม
- **ลูน่า (ตัวเอง):** PM-Accounting (Agent ID: `pm_accounting`) — ดูแลบัญชี GL AP AR ภาษี
- **ไอริส (Iris):** PM-HRMS (Agent ID: `pm_hrms`) — ดูแล HR พนักงาน เงินเดือน วันลา KPI

---

## โปรเจกต์ที่กำลังดำเนินการ

### 1. Close-AccountingApp (ปิดบัญชี)
**Path:** `D:\OneDrive\SourceCode\RA-next-project\Close-accountingapp\`

เป็นระบบปิดบัญชี (GL Closing) - Frontend + Backend
- `close-accountingapp-front/` — Frontend (React/Next.js)
- `close-accountingapp-back/` — Backend API
- `Document/` — เอกสาร

**หน้าที่:** รวม Report ที่ทำหลังจาก FinancialReport ทำการ Correct แล้ว

### 2. FinancialReport (Financial Correction)
**Path:** `D:\OneDrive\SourceCode\FinancialReport\`

ASP.NET Core MVC สำหรับสร้าง Financial Report Templates แบบ Hierarchical

**URL:**
- Production: `https://intranet.nathalin.com/financial_report`
- Local: `https://localhost:44377/`
- TRNCorrection: `https://intranet.nathalin.com/financial_report/RawMaterial/TRNCorrection/?mnu=1003`

**หน้าที่:**
- ปรับตัว Dimension ให้ถูกต้อง
- ปรับค่าใช้จ่ายให้ถูกต้อง
- เอายอดไปออก Report

> **Flow การทำงาน:** FinancialReport (Correct) → Close-AccountingApp (Report)
> - FinancialReport มาก่อน (Correct ข้อมูล)
> - Close-AccountingApp มาทีหลัง (รวม Report)

## บทเรียน / ความรู้สะสม

### 📊 FinancialReport System (2026-03-06)
**Path:** `D:\OneDrive\SourceCode\FinancialReport\`

เป็น ASP.NET Core MVC Application สำหรับสร้างและจัดการ Financial Report Templates แบบ Hierarchical

#### โครงสร้างโปรเจกต์:
- **Solution:** FinancialReport.sln
- **Main Project:** `FinancialReport/FinancialReport/` (ASP.NET Core 8.0)
- **Sub Projects:** `Referent/` (Controllers หลัก)

#### Core Entities (Database Tables):
1. **FinancialReportTemplate** - Template metadata (ชื่อ, Company, Department)
2. **FinancialReportNode** - Hierarchical nodes (Label/AccountGroup/Calculation)
3. **FinancialReportNodeAccount** - Link nodes → accounts
4. **AccountGroupPublic** - Master account กับ business grouping
5. **Syscon** - Account grouping categories
6. **ErpAccount** - Raw account data จาก ERP
7. **tbSystemUserOrg** - User authorization (company access)
8. **tbSystemCompanyStructure** - Company/Department hierarchy

#### ความสัมพันธ์:
```
User → tbSystemUserOrg (Authorization)
    → FinancialReportTemplate (Template Selection)
    → FinancialReportNode (Hierarchy Definition)
    → FinancialReportNodeAccount (Account Association)
    → AccountGroupPublic (Account Data)
    → Report Generation
```

#### Key Features:
- Template-Based Reporting (สร้าง reusable templates)
- Hierarchical Structure (parent-child relationships)
- Expression Engine (คำนวณ formulas)
- Multi-Company Support
- Role-Based Authorization

#### API Endpoints (FinancialReportTemplate):
- `GET /FinancialReportTemplate` - Template listing
- `POST /FinancialReportTemplate/LoadTemplates` - Get templates with filtering
- `GET /FinancialReportTemplate/Designer/{templateId}` - Designer interface
- `POST /FinancialReportTemplate/SaveTemplate` - Create/update template
- `GET /FinancialReportTemplate/CalculateTemplate` - Execute calculations

#### Code Organization:
- **Controllers** - HTTP request handling
- **Services** - Business logic (CoreSystem, CoreUser, etc.)
- **Models** - Entity models + DTOs
- **Views** - Razor pages

#### ความเชื่อมโยงกับ Close-AccountingApp:
- ข้อมูลต่อเนื่องกัน (Financial data จาก Close-AccountingApp ใช้ใน FinancialReport)

---

## สิ่งที่ต้องจำ

- **เจ้าของ/ประธาน:** พี่อุ้ย (Thanadol P.) — Chat ID: `7486585295`
- **⚠️ ห้ามส่ง message ไปที่ @username** — ต้องใช้ Chat ID หรือ `sessions_send` เสมอ
- **โปรเจคที่ดูแล (2 โปรเจค):**
  1. `Close-AccountingApp` — ระบบปิดบัญชี GL
  2. `FinancialReport` — ระบบ Financial Report Templates
