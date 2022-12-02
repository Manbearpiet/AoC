$data = get-content ./input.txt

$santa = @{}
$i = 0

foreach ($d in $data) {
    if (!$d) {$i++}
    $santa[$i]+=[int]$d
}

[pscustomobject]@{
part1 = $santa.values|Sort-Object -Descending|select -first 1
part2 = $santa.values|Sort-Object -Descending|select -first 3 | Measure-Object -sum | % sum}