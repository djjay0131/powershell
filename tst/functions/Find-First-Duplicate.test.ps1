Describe "Import Get-Planet.ps1" {
    BeforeAll {
        . $PSScriptRoot\..\..\src\functions\Find-First-Recurring-Character.ps1
    }
}

Describe 'Find-First-Recurring-Character' {
    It "Given string 'abcdedcba' returns 'd' " {
        $firstRecurringCharacter = Find-First-Recurring-Character 'abcdedcba'
        $firstRecurringCharacter | Should Be 'd'
    }
    It "Given string 'aabcdedcba' returns 'a' " {
        $firstRecurringCharacter = Find-First-Recurring-Character 'aabcdedcba'
        $firstRecurringCharacter | Should Be 'a'
    }
    It "Given string '`12345678890-=qwertyuiop[]\asdfghjkl;zxcvbnmm,./<>?!@#$%^&*(()_+|}{' returns '{' " {
        $firstRecurringCharacter = Find-First-Recurring-Character '`12345678890-=qwertyuiop[]\asdfghjkl;zxcvbnmm,./<>?!@#$%^&*(()_+|}{{'
        $firstRecurringCharacter | Should Be '8'
    }
    It "Given string '`12345678890-=qwertyuiop[]\asdfghjkl;zxcvbnmm,./<>?!@#$%^&*(()_+|}{' returns '{' " {
        $firstRecurringCharacter = Find-First-Recurring-Character '`1234567890-=qwertyuiop[]\asdfghjkl;zxcvbnm,./<>?!@#$%^&*(_+|}{{'
        $firstRecurringCharacter | Should Be '{'
    }
    It "Given string 'ab  cdedcba' returns ' ' " {
        $firstRecurringCharacter = Find-First-Recurring-Character 'ab  cdedcba'
        $firstRecurringCharacter | Should Be ' '
    }
}