$csv_info = Import-Csv 'c:\data.csv'
foreach ($line in $csv_info) {
    $fio=$($line.fio)
    # echo $fio
    $title=$($line.title)
    # echo $title
    $user = Get-ADUser -Filter {displayName -eq $fio}
    # echo $user.Name
    if ($user) {
        Set-ADUser $user -Replace @{title=$title; description=$title}
    }
}