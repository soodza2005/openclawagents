$conn = New-Object System.Data.SqlClient.SqlConnection
$conn.ConnectionString = "Server=10.8.8.201;Database=BC;User Id=sqlconn;Password=ritrbi6I;Encrypt=False"
$conn.Open()

# Check import journal entries for NAT
Write-Host "=== Import Journal Entries for NAT ==="
$cmd = $conn.CreateCommand()
$cmd.CommandText = @"
SELECT TOP 50 
    j.*,
    c.Code as CompanyCode
FROM tbl_import_journal_entries j
LEFT JOIN tbl_bc_company c ON j.CompanyId = c.Id
WHERE j.CompanyId = 1
ORDER BY j.DocumentDate DESC
"@
$reader = $cmd.ExecuteReader()

$dt = New-Object System.Data.DataTable
$dt.Load($reader)
$dt | Format-Table -AutoSize

$reader.Close()

# Check distinct periods
Write-Host "`n=== Distinct DocumentDate/Periods ==="
$cmd2 = $conn.CreateCommand()
$cmd2.CommandText = "SELECT DISTINCT CONVERT(varchar(7), DocumentDate, 127) as Period FROM tbl_import_journal_entries WHERE CompanyId = 1 ORDER BY Period DESC"
$reader2 = $cmd2.ExecuteReader()

while ($reader2.Read()) {
    Write-Host $reader2[0]
}

$reader2.Close()
$conn.Close()
