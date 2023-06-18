$object = @{
    'a' = @{
        'b' = @{
            'c' = 'd'
        }
    }
}

$key = 'a/b/c'
$value = Get-NestedValue -Object $object -Key $key
Write-Host $value  # Output: d
