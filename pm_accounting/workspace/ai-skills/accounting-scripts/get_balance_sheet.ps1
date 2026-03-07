$conn = New-Object System.Data.SqlClient.SqlConnection
$conn.ConnectionString = "Server=10.8.8.201;Database=Close_Accounting_DEV;User Id=sqlconn;Password=ritrbi6I;Encrypt=False"
$conn.Open()

# Check EndDate values
$cmd = $conn.CreateCommand()
$cmd.CommandText = "SELECT DISTINCT EndDate FROM SeparateKeyInBalances ORDER BY EndDate DESC"
$reader = $cmd.ExecuteReader()

Write-Host "=== Available EndDates ==="
while ($reader.Read()) {
    Write-Host $reader[0]
}

$reader.Close()

# Get balance for Sep 2025
Write-Host "`n=== Balance Sheet Data (Sep 2025) ==="
$cmd2 = $conn.CreateCommand()
$cmd2.CommandText = @"
SELECT 
    NameEn as AccountName,
    ParentNameEn as GroupName,
    Balance,
    EndDate
FROM SeparateKeyInBalances
WHERE EndDate >= '2025-09-01' AND EndDate < '2025-10-01'
ORDER BY GroupSequense, NameEn
"@
$reader2 = $cmd2.ExecuteReader()

$dt = New-Object System.Data.DataTable
$dt.Load($reader2)
$dt | Format-Table -AutoSize

$reader2.Close()
$conn.Close()
