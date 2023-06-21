$nestedObject = @{
    level1 = @{
        level2 = @{
            level3 = "Nested value"
        }
    }
}

$result = Get-NestedValue -Object $nestedObject -Key "level1.level2.level3"
Write-Host $result
