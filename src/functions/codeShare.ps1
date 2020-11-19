


$json = @'
[
    {
      "Server": "LAX-WEB01",
      "Software": ["Adobe","Java","Flash","Chrome","IE","Norton"]
    },
    {
      "Server": "LAX-WEB02",
      "Software": ["Java","Norton","Office","Flash"]
    },
    {
      "Server": "LAX-WEB03",
      "Software": ["Flash","IE","Chrome","Norton","Adobe"]
    },
    {
      "Server": "LAX-WEB04",
      "Software": ["Adobe","Flash","IE","Chrome"]
    },
    {
      "Server": "LAX-WEB05",
      "Software": ["Flash","Norton","Office", "Jira"]
    }
]
'@

$serverDataList = $json | ConvertFrom-Json

$javaServers = $serverDataList | Where-Object { $_.Software -contains "Java" }

$javaServers
Write-Output ""
$softwareSet = @{}

foreach ($server in $serverDataList) {
    foreach ($software in $server.Software) {
        if ($softwareSet.keys -contains $software) {
          $softwareSet[$software] = $softwareSet[$software] + 1;
        } else {
          $softwareSet.Add($software, 1);
        }
    }
}

$allServers = $softwareSet.GetEnumerator() | Where-Object { $_.Value -eq 5 } | ForEach-Object { $_.Key }
Write-Output "Software on all servers: $allServers"

$twoServers = $softwareSet.GetEnumerator() | Where-Object { $_.Value -eq 2 } | ForEach-Object { $_.Key }
Write-Output "Software on two servers: $twoServers"

$twoServerDataList = @()
 $serverDataList | ForEach-Object {
   if ($_.Software -contains $twoServers[0] -or $_.Software -contains $twoServers[1]) {
    $twoServerDataList += $_.Server;
  }
}
$twoServerDataList

# Task 1: Output (or save to a variable) just the server objects that have 'Java' installed.

# Task 2: Find and output the list of software that every server has in common. So in the example above, Flash is the only piece of software that every single server has.

# Task 3.A: Find the list of software that is installed on exactly two servers. (in this example those would be Java, Office)

# Task 3.B: Find the list of software that is installed on exactly two servers, but this time return the servers that were hosting each software.







