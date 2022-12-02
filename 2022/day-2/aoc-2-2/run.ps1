
<#
Opponent
- A for Rock
- B for Paper
- C for Scissors

Your choice
- X for Rock
- Y for Paper
- Z for Scissors

Your choice (part 2)
- X for Lose
- Y for Draw
- Z for Win

Points system
    Outcome
    0 - Loss
    3 - Draw
    6 - Win

    Choice
    1 - Rock
    2 - Paper
    3 - Scissors
#>

$input = Get-Content $PSScriptRoot/input.txt
# $input = Get-Content $PSScriptRoot/sampleinput.txt

$score = foreach ($line in $input) {
    $round = $line -split " "
    $opponent = $round[0]
    $result = $round[1]

    $points = 0

    switch ($result) {
        'X' {
            $points += 0
            switch ($opponent) {
                'A' { $choice = 'Z' }
                'B' { $choice = 'X' }
                'C' { $choice = 'Y' }
            }
        }
        'Y' {
            $points += 3
            switch ($opponent) {
                'A' { $choice = 'X' }
                'B' { $choice = 'Y' }
                'C' { $choice = 'Z' }
            }
        }
        'Z' {
            $points += 6
            switch ($opponent) {
                'A' { $choice = 'Y' }
                'B' { $choice = 'Z' }
                'C' { $choice = 'X' }
            }
        }
    }

    switch ($choice) {
        'X' { $points += 1 } # draw
        'Y' { $points += 2 } # win
        'Z' { $points += 3 } # loss
    }

    $points
}
$score | Measure-Object -Sum