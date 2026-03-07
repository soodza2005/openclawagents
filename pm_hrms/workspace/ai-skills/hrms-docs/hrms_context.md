# HRMS Project Context

## 1. Project Overview

**Project Name:** nathalin.hrms  
**Type:** ASP.NET Core Web Application (MVC)  
**Description:** Nathalin HRMS (Human Resource Management System) - Enterprise HR management system for Nathalin Company  
**Location:** `D:\OneDrive\SourceCode\nathalin.hrms`  
**Solution File:** `nathalin.hrms.sln`

---

## 2. Technology Stack

### Framework & Runtime
- **.NET Version:** .NET 8.0
- **Framework:** ASP.NET Core 8.0 MVC
- **Target Framework:** `net8.0`

### Database
- **Database Engine:** Microsoft SQL Server
- **Connection Server:** `10.8.8.201`
- **Database Name:** HRMS (with DEV5 for development)
- **ORM:** Entity Framework Core 9.0.9
- **EF Packages:**
  - `Microsoft.EntityFrameworkCore` (9.0.9)
  - `Microsoft.EntityFrameworkCore.SqlServer` (9.0.9)
  - `Microsoft.EntityFrameworkCore.Design` (9.0.9)
  - `Microsoft.EntityFrameworkCore.Proxies` (9.0.9)
  - `Microsoft.EntityFrameworkCore.Tools` (9.0.9)

### Authentication & Security
- **Azure AD Authentication:** Microsoft Identity Web
- **JWT Bearer Authentication:** `Microsoft.AspNetCore.Authentication.JwtBearer` (8.0.20)
- **OpenID Connect:** `Microsoft.AspNetCore.Authentication.OpenIdConnect` (8.0.16)
- **Azure Identity:** `Azure.Identity` (1.17.1)
- **JWT Library:** `System.IdentityModel.Tokens.Jwt` (8.14.0)

### Key Libraries & Packages
| Package | Version | Purpose |
|---------|---------|---------|
| Mapster | 7.4.0 | Object mapping |
| ClosedXML | 0.105.0 | Excel file manipulation |
| Select.HtmlToPdf.NetCore | 25.2.0 | PDF generation |
| RestSharp | 112.1.0 | REST API client |
| Newtonsoft.Json | 13.0.4 | JSON serialization |
| NLog.Web.AspNetCore | 6.0.4 | Logging framework |
| Microsoft.Data.SqlClient | 6.1.1 | SQL Server connectivity |

---

## 3. Project Structure

```
nathalin.hrms/
├── .claude/                  # Claude Code settings
├── .vscode/                  # VS Code settings
├── .github/                  # GitHub configurations
├── Bkk/                      # Bangkok-specific views
├── nathalin.hrms/           # Main project directory
│   ├── API/                  # API controllers
│   ├── Areas/               # MVC Areas
│   │   ├── EmpManager/      # Employee Management area
│   │   └── SitePlan/        # Site Planning area
│   ├── Controllers/         # MVC Controllers
│   ├── Data/                # Database contexts
│   ├── DTOs/                # Data Transfer Objects
│   ├── Enums/               # Enumerations
│   ├── Features/            # Feature modules
│   │   └── EmployeeService/ # Employee service feature
│   ├── Helpers/             # Helper classes
│   ├── Migrations/          # EF Core migrations
│   ├── Models/              # Entity models
│   ├── Models.Views/        # View models
│   ├── Resources/          # Localization resources
│   ├── Services/            # Business logic services
│   ├── Utils/               # Utility classes
│   ├── Views/               # Razor views
│   └── wwwroot/             # Static web assets
└── sql/                     # SQL scripts
```

---

## 4. Key Modules & Features

### Core HR Modules

| Module | Controller | Purpose |
|--------|------------|---------|
| **Leave Management** | `LeaveController` | Handle employee leave requests, approvals, and tracking |
| **Overtime** | `OvertimeController` | Manage overtime requests and approvals |
| **Training** | `TrainingController` | Training course enrollment and management |
| **Training Allowance** | `TrainingAllowanceController` | Training expense and allowance processing |
| **Training Expense** | `TrainingExpenseController` | Training expense claims |
| **Offsite** | `OffsiteController` | Offsite work requests and management |
| **WFH (Work From Home)** | `WFHController` | Work from home request management |
| **Employee Info** | `EmployeeController` | Employee profile and information |
| **Profile** | `ProfileController` | User profile management |
| **Welfare** | `WelfareController` | Employee welfare benefits |
| **Welfare - Child Scholar** | `WelfareChildScholarController` | Child education scholarship |
| **Welfare - Education Loan** | `WelfareEmEducationLoanController` | Education loan management |
| **Welfare - Gift** | `WelfareEmWellGiftController` | Employee well-being gifts |
| **Welfare - Insurance** | `WelfareInsuranceController` | Insurance benefits |
| **Welfare - Loss** | `WelfareLossController` | Loss compensation claims |
| **Welfare - New Born Gift** | `WelfareNewBornGiftController` | Newborn baby gifts |
| **Welfare - Provident Fund** | `WelFareProFundController` | Provident fund management |
| **Welfare - Share** | `WelfareShareController` | Welfare sharing/claims |
| **Welfare Setup** | `WelFareSetupController` | Welfare configuration |
| **Change Time** | `ChangeTimeController` | Working time change requests |
| **Update Shift** | `UpdateShiftController` | Shift schedule updates |
| **Risk Assessment** | `RiskAssessmentController` | Workplace risk assessment |
| **Contact/Quarantine** | `ContactController` | COVID-19 contact tracing |
| **Administrative** | `AdministrativeController` | Administrative tasks |
| **Job/Recruitment** | `JobController` | Job postings and recruitment |
| **Key Evaluation 3M** | `KeyEvaluate3MController` | 3-month key performance evaluation |
| **Report** | `ReportController` | Reporting module |
| **Notify** | `NotifyController` | Notification system |

### Feature Areas

1. **Employee Service (Features/EmployeeService)**
   - Employee onboarding management
   - Employee resignation handling
   - Contractor management
   - Employee status tracking

2. **EmpManager Area**
   - `EmployeesController` - Employee management
   - `EmpOnboardingController` - Onboarding workflow
   - `ReportController` - Employee reports

3. **SitePlan Area**
   - Site planning and scheduling

---

## 5. Database Schema Overview

### Multiple Database Contexts

The project uses multiple DbContext classes for different functional areas:

| DbContext | Purpose |
|-----------|---------|
| `AppData` | Main HRMS database - Core HR, Leave, Overtime, Training, etc. |
| `AppDbAllEmpinfo` | Employee information database |
| `AppDbOffsite` | Offsite work requests |
| `AppDbSitePlan` | Site planning data |
| `AppDbTrainingAllowance` | Training allowance data |
| `AppDbWelfare` | Employee welfare data |

### Main Database Tables (Core Entities)

#### Employee Related
- `EmpInfo` - Employee master information (view)
- `EmpCompany` - Company data (view)
- `EmpDepartment` - Department data (view)
- `EmpDivision` - Division data (view)
- `EmpPosition` - Position data (view)
- `EmpSection` - Section data (view)
- `EmpGrade` - Employee grade data (view)
- `EmpEducation` - Education data (view)
- `EmpGender` - Gender reference (view)
- `EmpShiftCode` - Shift code reference (view)
- `EmpShiftPattern` - Shift pattern data (view)
- `EmpStatistic` - Employee statistics (view)
- `EmpStatisticSummary` - Employee statistics summary (view)
- `EmpLeaveBenefit` - Leave benefits (view)
- `EmpLeaveCode` - Leave code reference (view)
- `EmpWorkTime` - Work time data (view)
- `EmpOvertimeJobTitle` - Overtime job titles (view)
- `EmpOvertimeType` - Overtime types (view)
- `EmpAddress` - Employee addresses
- `EmpAddressInfo` - Address information
- `EmpEducationInfo` - Education information
- `EmpDegree` - Degree reference
- `EmpDegreeClass` - Degree classification
- `EmpInstitute` - Educational institutes
- `EmpMajor` - Academic majors
- `EmpDistrict` - District reference
- `EmpAmphur` - Amphur reference
- `EmpProvince` - Province reference
- `EmpNationality` - Nationality reference

#### Request/Transaction Tables
- `ReqLeave` - Leave requests
- `ReqLeaveDate` - Leave dates
- `ReqLeaveAttachment` - Leave attachments
- `ReqLeaveEvent` - Leave workflow events
- `ReqOvertime` - Overtime requests
- `ReqOvertimeDate` - Overtime dates
- `ReqOvertimeAttachment` - Overtime attachments
- `ReqOvertimeEvent` - Overtime workflow events
- `ReqTraining` - Training requests
- `ReqTrainingDate` - Training dates
- `ReqTrainingAttachment` - Training attachments
- `ReqTrainingEvent` - Training workflow events
- `ReqTrainingEvaluation` - Training evaluations
- `ReqTrainingEvaluationResult` - Training evaluation results
- `ReqTrainingExpense` - Training expense claims
- `ReqTrainingExpenseDetail` - Training expense details
- `ReqTrainingAllowance` - Training allowance requests
- `ReqChangeTime` - Time change requests
- `ReqUpdateShift` - Shift update requests
- `ReqRiskAssessment` - Risk assessment requests
- `ReqContact` - Contact/quarantine requests
- `ReqFromHome` - Work from home requests
- `ReqOffsite` - Offsite work requests
- `ReqOffsitePassenger` - Offsite passengers
- `ReqOffsitePassengerTrip` - Offsite trip details
- `ReqOffsiteInsurance` - Offsite insurance
- `ReqWelfare` - Welfare requests
- `ReqWelfareLoan` - Welfare loan requests
- `ReqWelfareExpense` - Welfare expense claims
- `ReqWelfareExpenseItem` - Welfare expense items
- `ReqUpdateProfile` - Profile update requests
- `ReqKeyEvaluate3M` - 3-month evaluation requests
- `ReqKeyEvaluate3MTemplate` - Evaluation templates
- `ReqKeyEvaluate3MEvoluationResult` - Evaluation results

#### Reference Tables
- `RefLeave` - Leave type reference
- `RefHoliday` - Holiday calendar
- `RefOvertimeProject` - Overtime project reference
- `RefRequest` - Request type reference
- `RefUserRole` - User role reference
- `RefUserAccess` - User access permissions
- `RefSpecialLeave` - Special leave types
- `RefShiftCode` - Shift code reference
- `RefExpense` - Expense types
- `RefExpenseByGrade` - Expense by employee grade
- `RefOffsiteSetup` - Offsite configuration
- `RefOffsiteExpense` - Offsite expense rules
- `RefOffsiteExpenseCondition` - Offsite expense conditions
- `RefTrainingEvaluation` - Training evaluation reference
- `RefTrainingEvaluationTopic` - Training evaluation topics
- `RefContactType` - Contact type reference
- `RefContactTypeFieldSet` - Contact type field sets
- `RefContactTypeField` - Contact type fields
- `RefRiskAssessmentVerify` - Risk assessment verification
- `RefProvince` - Province reference
- `RefDistrict` - District reference
- `RefSubDistrict` - Sub-district reference

#### System Tables
- `PortalSystem` - Portal system configuration
- `PortalModule` - Portal module configuration
- `SystemMenu` - System menu definitions
- `Logging` - System logging
- `LogAcceptOT` - Overtime acceptance logging
- `LogActivitiesEmpProfile` - Employee profile activity logs
- `tbHrmsConfig` - HRMS configuration
- `RefNotify` - Notification settings
- `PendingTgLeave` - Pending leave sync to Timegrid
- `PendingTgOvertime` - Pending overtime sync to Timegrid
- `PendingTgChangeTime` - Pending time change sync to Timegrid

#### Views (Read-only)
- `ViewWaitingAction` - Pending actions view
- `ViewWaitingApprove` - Pending approvals view
- `ViewTrainingInternal` - Internal training view
- `ViewCurrentAddress` - Current address view
- `ViewCompanyDepartment` - Company-department view
- `ViewCompanyDepartmentSection` - Company-department-section view
- `ViewEmpCompare` - Employee comparison view
- `View_TblEmployee` - Employee table view
- `View_EmployeeInfoLocal` - Local employee info view
- `View_SystemUserInfo` - System user info view

---

## 6. API Endpoints Structure

### Main API Controller
- `API/VRMController.cs` - VRM (Vehicle Resource Management) API integration

### Integration Services (External APIs)
The system integrates with multiple internal services defined in `appsettings.json`:

| Service | URL Pattern |
|---------|-------------|
| HR Service | `https://intranet.nathalin.com/hrservice/api` |
| WorkFlow Service | `https://intranet.nathalin.com/wfservice/api` |
| Financial Service | `https://intranet.nathalin.com/raserver_next/api` |
| VRM Service | `https://intranet.nathalin.com/vrm/api` |
| RA Server | `https://intranet.nathalin.com/raserver_next/api` |
| Cash Advance | `https://cashadv.nathalin.com/api` |
| Dashboard Service | `https://intranet.nathalin.com/dashboardservice/api` |
| Global Config | `https://globconf-qa.nathalin.com/api` |

### Notification System
- Notify endpoint: `https://intranet.nathalin.com/notify/api/`

---

## 7. Important Configuration Files

### appsettings.json
Main configuration file containing:
- **AzureAdWebApi:** Azure AD configuration for Web API
- **AzureAd:** Azure AD authentication settings
- **ConnectionStrings:** Database connection (DefaultConnection)
- **EmailConfig:** SMTP configuration for Office 365
- **CommonService:** Internal service URLs and credentials
- **BotConfig:** Notification bot configuration
- **WorkFlowConfig:** Workflow service configuration
- **VRMConfig:** VRM service configuration
- **SiteInfo:** Site root paths (local and server)
- **PowerBIApi:** Power BI API key

### nlog.config
NLog logging configuration

### libman.json
Library Manager configuration for client-side packages

### nathalin.hrms.csproj
Project file with all NuGet package references

---

## 8. Coding Conventions & Patterns

### Service Layer Pattern
The project uses a Service Layer pattern with:
- **Interface:** `ICore*` (e.g., `ICoreLeave`, `ICoreOvertime`)
- **Implementation:** `Core*` (e.g., `CoreLeave`, `CoreOvertime`)
- **Registration:** Scoped services in `Startup.cs`

Example:
```csharp
// Interface
public interface ICoreLeave
{
    // Methods
}

// Implementation
public class CoreLeave : ICoreLeave
{
    // Implementation
}

// Registration in Startup.cs
services.AddScoped<ICoreLeave, CoreLeave>();
```

### Entity Framework Conventions
- Entity models in `Models/` folder
- View models in `Models.Views/` folder
- Multiple DbContext classes for different modules
- Migrations organized in `Migrations/` folder

### Controller Pattern
- Standard MVC Controllers in `Controllers/` folder
- Attribute-based routing
- Async/await patterns for database operations

### View Pattern
- Razor Views in `Views/` folder
- Area-specific views in `Areas/{AreaName}/Views/`
- Shared views in `Views/Shared/`

### Authentication
- Azure AD SSO with OpenID Connect
- JWT Bearer token support
- Cookie-based authentication fallback

### Logging
- NLog for structured logging
- Log levels: Information, Warning, Error

### Object Mapping
- Mapster library for DTO to Entity mapping

### File Handling
- Excel export via ClosedXML
- PDF generation via Select.HtmlToPdf

---

## 9. Development & Build

### Build Commands
```bash
dotnet build
dotnet run
dotnet migrate
dotnet ef migrations add
```

### Database Migrations
- Multiple migration folders for different DbContexts:
  - `AppDbEmpinfoMigrations`
  - `AppDbOffsiteMigrations`
  - `AppDbSitePlanMigrations`
  - `AppDbTrainingAllowanceMigrations`
  - `AppDbWelfareMigrations`

### External Dependencies
- Azure AD tenant: `nathalin.com`
- Email: Office 365 SMTP (smtp.office365.com)

---

## 10. Additional Notes

### Disabled/Excluded Features
Some modules are commented out or excluded from compilation:
- `Views\Outside\` - Outside module views
- `Views\Plane\` - Plane module views
- `ReqOutside*` models - Outside request models
- `ReqPlane*` models - Plane request models
- `CoreOffsite - Copy.cs` - Duplicate service file

### Development Notes
- User Secrets ID: `aspnet-nathalin.hrms_Server-702aa5f7-c25f-4fb1-beb2-8ba2413904de`
- Trusted Connection disabled for database (SQL authentication)
- TrustServerCertificate enabled for SQL Server connection
