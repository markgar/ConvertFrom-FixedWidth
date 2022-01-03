function ConvertFrom-FixedWidth {
    Param(
        [parameter(Mandatory = $true)] [object] $FixedWidthTableText,
        [parameter(Mandatory = $true)] [object] $ColumnIndexArray,
        [parameter(Mandatory = $false)] [string] $Delimiter = ","
    )

    $columns = $ColumnIndexArray | Sort-Object    

    $delimited = $FixedWidthTableText | Foreach-Object {
        $currentIndex = 0
        $priorIndex = 0
        $line = $_

        $newLine = ""
        $firstColumn = $true
        $columns | Foreach-Object {
            $currentIndex = $_

            if ($firstColumn -ne $true) {
                $newLine = $newLine + $Delimiter
            }

            $newLine = $newLine + $line.Substring($priorIndex, $currentIndex - $priorIndex).Trim()

            $priorIndex = $_
            $firstColumn = $false
        }

        $newLine = $newLine + $Delimiter + $_.Substring($currentIndex, $_.Length-$currentIndex).Trim()
        $newLine
    }

    $converted = $delimited | ConvertFrom-Csv -Delimiter $Delimiter

    return $converted
}