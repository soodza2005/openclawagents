$csv = Import-Csv -Path "D:\AI_Agent\openclaw\agents\pm_accounting\workspace\PL_NAT_Sep2025.csv"
$csv | Export-Excel -Path "D:\AI_Agent\openclaw\agents\pm_accounting\workspace\PL_NAT_Sep2025.xlsx" -AutoSize -TableName "PLData" -WorksheetName "PL Report" -Title "PL Report - NAT - September 2025"
