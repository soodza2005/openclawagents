$conn = New-Object System.Data.SqlClient.SqlConnection
$conn.ConnectionString = "Server=10.8.8.201;Database=Close_Accounting_DEV;User Id=sqlconn;Password=ritrbi6I;Encrypt=False"
$conn.Open()

# Get all data
$cmd = $conn.CreateCommand()
$cmd.CommandText = @"
SELECT 
    NameEn as AccountName,
    ParentNameEn as GroupName,
    Balance,
    EndDate,
    CompanyCode,
    Type
FROM SeparateKeyInBalances
ORDER BY EndDate, GroupSequense, NameEn
"@
$reader = $cmd.ExecuteReader()

$dt = New-Object System.Data.DataTable
$dt.Load($reader)

Write-Host "=== All SeparateKeyInBalances Data ==="
$dt | Format-Table -AutoSize

Write-Host "`n=== Summary by EndDate ==="
$dt | Group-Object EndDate | ForEach-Object {
    Write-Host "Date: $($_.Name) - Count: $($_.Count)"
}

$reader.Close()
$conn.Close()
