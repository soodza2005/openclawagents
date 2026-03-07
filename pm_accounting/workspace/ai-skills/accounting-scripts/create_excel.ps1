$excel = New-Object -ComObject Excel.Application
$excel.Visible = $false
$excel.DisplayAlerts = $false

$workbook = $excel.Workbooks.Add()
$worksheet = $workbook.Worksheets.Item(1)
$worksheet.Name = "PL Report"

# Header
$worksheet.Cells.Item(1,1) = "PL Report - NAT - September 2025"
$worksheet.Cells.Item(1,1).Font.Bold = $true
$worksheet.Cells.Item(1,1).Font.Size = 14
$worksheet.Cells.Item(1,1).MergeCells = $true

# Column Headers
$worksheet.Cells.Item(3,1) = "Account Code"
$worksheet.Cells.Item(3,2) = "Account Name"
$worksheet.Cells.Item(3,3) = "NAT Total"
$worksheet.Cells.Item(3,4) = "Category"

# Format header
$worksheet.Range("A3:D3").Font.Bold = $true
$worksheet.Range("A3:D3").Interior.Color = [System.Drawing.Color]::FromArgb(0, 51, 102)

# Data
$data = @(
    @("REVENUE", "", "", ""),
    @("40012002", "Sea Freight Income of Voyage", 11690443.48, "Freight Income/Service Income"),
    @("40012008", "Manning Management Income (HR/Crew)", 1749041.00, "Freight Income/Service Income"),
    @("40012012", "Catering And Service Income", 514355.00, "Freight Income/Service Income"),
    @("40012019", "Fitness Services Income", 256060.00, "Office Rental and Mannagement Service fee"),
    @("40012021", "MIS Service Income", 1363918.43, "Freight Income/Service Income"),
    @("40012023", "New ERP Service Income", 1256727.18, "Office Rental and Mannagement Service fee"),
    @("40012025", "Guaruntees Service Income", 111699.81, "Office Rental and Mannagement Service fee"),
    @("40012026", "Legal Service Income", 151000.00, "Office Rental and Mannagement Service fee"),
    @("40012036", "Admin & utility management service Income", 1190466.13, "Office Rental and Mannagement Service fee"),
    @("40012037", "Office Rental Income", 609859.50, "Office Rental and Mannagement Service fee"),
    @("40012044", "Car Service Income", 138642.00, "Office Rental and Mannagement Service fee"),
    @("40022002", "Interest Income", 32391080.60, "Interest Income"),
    @("40022003", "Gain/Loss on exchange rate (realization)", -2749.01, "Gain(Loss) on foreign exchange rate"),
    @("40022004", "Gain/Loss on exchange rate (unrealization)", 767.16, "Gain(Loss) on foreign exchange rate"),
    @("40022019", "Others Income", 7287.00, "Other Income"),
    @("", "", "", ""),
    @("EXPENSES", "", "", ""),
    @("50010002", "Cost of goods sold - Catering Service", 477546.46, "Cost of Freight and Services"),
    @("50020007", "Cost of Service - Transportation expense of Voyage", 11544312.93, "Cost of Freight and Services"),
    @("50050001", "Plan Maintenance (PMS)", 179299.14, "Cost of Freight and Services"),
    @("50060001", "Consumable Consumption", 57626.26, "Cost of Freight and Services"),
    @("50060002", "Provisions Consumption", 19850.30, "Cost of Freight and Services"),
    @("50060008", "Stationary Consumption", 8260.94, "Cost of Freight and Services"),
    @("50090001", "Building Insurance", 3145.80, "Cost of Freight and Services"),
    @("50090007", "Vehical Insurance", 9049.80, "Cost of Freight and Services"),
    @("50090009", "Health and Life Insurance", 99541.80, "Cost of Freight and Services"),
    @("50090010", "Personal Insurance", 8306.10, "Cost of Freight and Services"),
    @("50090011", "Accident Insurance", 6454.50, "Cost of Freight and Services"),
    @("50110001", "Entertainment", 369435.47, "Administrative Expenses"),
    @("50110003", "Member Fee", 2204.69, "Administrative Expenses"),
    @("50110006", "CSR Expense", 10052.00, "Administrative Expenses"),
    @("50110015", "Development Business Dept. Expense", 700.00, "Administrative Expenses"),
    @("50110016", "Accounting Audit Fee", 133334.00, "Administrative Expenses"),
    @("50110027", "Water&electricity cost", 299511.21, "Administrative Expenses")
)

$row = 4
foreach ($item in $data) {
    $worksheet.Cells.Item($row,1) = $item[0]
    $worksheet.Cells.Item($row,2) = $item[1]
    if ($item[2] -ne "") {
        $worksheet.Cells.Item($row,3) = $item[2]
        $worksheet.Cells.Item($row,3).NumberFormat = "#,##0.00"
    }
    $worksheet.Cells.Item($row,4) = $item[3]
    
    # Bold for section headers
    if ($item[0] -eq "REVENUE" -or $item[0] -eq "EXPENSES") {
        $worksheet.Range("A$row:D$row").Font.Bold = $true
    }
    $row++
}

# AutoFit columns
$worksheet.Columns.Item("A:D").AutoFit() | Out-Null

# Save
$workbook.SaveAs("D:\AI_Agent\openclaw\agents\pm_accounting\workspace\PL_NAT_Sep2025.xlsx")
$workbook.Close()
$excel.Quit()

[System.Runtime.Interopservices.Marshal]::ReleaseComObject($excel) | Out-Null

Write-Host "Excel file created successfully!"
