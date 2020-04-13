# ConvertFrom-FixedWidth

ConvertFrom-FixedWidth is a Powershell function served from the PowerShell Gallery that allows you to take fixed width tabular data and convert it to a PowerShell object array. 

![Publish to Powershell Gallery](https://github.com/markgar/ConvertFrom-FixedWidth/workflows/Publish%20to%20Powershell%20Gallery/badge.svg)

For example, a table of data in a file called "sample1.txt" that has these contents:

```
Column1   Column2       Column3
038727664 0521829914551 6034
038764    052182991451  60
```

Can be converted to an object array like this:
```PowerShell
# load the file from disk
$fixedWidthText = Get-Content -Path ./sample1.txt

# define the ordinal locations of the columns  (should be one less than the total number of columns)
# in this example the first and second columns are delimited at position 10
# the second column (between Column2 and Column3) is at position 24.  this is 24 positions from the left, not 24 from the prior column
$columns = 10, 24

# use ConvertFrom-FixedWidth function from the PowerShell Gallery to get an object array
$objectTable = ConvertFrom-FixedWidth -FixedWidthTableText $fixedWidthText -ColumnIndexArray $columns

# export the object array as Json just to show what it looks like for debugging
$objectTable | ConvertTo-Json
```

## Installation

If you have the [PowerShellGet](https://msdn.microsoft.com/powershell/gallery/readme) module installed
you can enter the following command:

```PowerShell
Install-Module ConvertFrom-FixedWidth
```

Alternatively you can download a ZIP file of the latest version from our [Releases](https://github.com/markgar/ConvertFrom-FixedWidth/releases)
page.

## Maintainers

- [Mark Garner on github](https://github.com/markgar)
- [@mgarner on Twitter](http://twitter.com/mgarner)

## License

This project is [licensed under the MIT License](LICENSE).