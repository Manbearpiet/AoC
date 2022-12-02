# Not mine, from talarion on Discord

$data = Get-Content ./input.txt

$santa = @{}
$i = 0

foreach ($d in $data) {
    if (!$d) { $i++ }
    $santa[$i] += [int]$d
}

[pscustomobject]@{
    part1 = $santa.values | Sort-Object -Descending | select -First 1
    part2 = $santa.values | Sort-Object -Descending | select -First 3 | Measure-Object -Sum | % sum
}