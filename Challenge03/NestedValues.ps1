function Get-NestedValue {
    param (
        [Parameter(Mandatory=$true)]
        [object]$Object,
        
        [Parameter(Mandatory=$true)]
        [string]$Key
    )

    $keys = $Key -split '/'
    $value = $Object

    foreach ($k in $keys) {
        if ($value -is [System.Collections.IDictionary]) {
            if ($value.ContainsKey($k)) {
                $value = $value[$k]
            }
            else {
                return $null
            }
        }
        elseif ($value -is [System.Collections.IEnumerable] -and $k -match '^\d+$') {
            $index = [int]$k
            if ($index -ge 0 -and $index -lt $value.Count) {
                $value = $value[$index]
            }
            else {
                return $null
            }
        }
        else {
            return $null
        }
    }

    $value
}
