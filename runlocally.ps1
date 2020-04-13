# Always load the latest version
Remove-Module -Name ConvertFrom-FixedWidth
Import-Module -Name './ConvertFrom-FixedWidth/ConvertFrom-FixedWidth.psd1' -Force

#############################
# EXAMPLE1 
$fixedWidthText = Get-Content -Path ./sample1.txt
$columns = 10, 24

$objectTable = ConvertFrom-FixedWidth -FixedWidthTableText $fixedWidthText -ColumnIndexArray $columns

$objectTable | ConvertTo-Json

#############################
# EXAMPLE2
$fixedWidthText = Get-Content -Path ./sample2.txt
$columns = 20, 30

$objectTable = ConvertFrom-FixedWidth -FixedWidthTableText $fixedWidthText -ColumnIndexArray $columns

$objectTable | ConvertTo-Json

#############################
# EXAMPLE3
$fixedWidthText = Get-Content -Path ./sample3.txt
$columns = 20, 30

$objectTable = ConvertFrom-FixedWidth -FixedWidthTableText $fixedWidthText -ColumnIndexArray $columns

$objectTable | ConvertTo-Json