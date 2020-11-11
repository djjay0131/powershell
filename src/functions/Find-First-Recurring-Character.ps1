<#
Create a powershell function or cmdlet that takes an arbitrarily long string parameter $foo (e.g. 'abcdedcba') and returns the first recurring character in that Input string.
In 'abcdedcba', 'd' would be the first recurring character, so the cmdlet/function should return 'd' for that sample input.
#>

function Find-First-Recurring-Character {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
        [string]$foo
    )

    $set = New-Object System.Collections.Generic.HashSet[char];

    foreach ($char in $foo.ToCharArray()) {
        if (!$set.Add($char)) {
            return $char;
        }
    }
    return "";
}

