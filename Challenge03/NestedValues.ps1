function Get-NestedValue {
    param(
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        $Object,

        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        $Key
    )

    $keys = $Key -split '\.'

    foreach ($k in $keys) {
        if ($Object -is [System.Collections.IDictionary]) {
            $Object = $Object[$k]
        } elseif ($Object -is [System.Collections.IList]) {
            $Object = $Object[$k]
        } elseif ($Object -is [System.Management.Automation.PSCustomObject]) {
            $Object = $Object.$k
        } else {
            $Object = $null
            break
        }
    }

    $Object
}
