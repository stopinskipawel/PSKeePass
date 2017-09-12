function Set-KeePassDBPassword {
    Param
    (
         [Parameter(Mandatory=$true, Position=0)]
         [string] $Password 
    )

 

If (!(Test-Path "HKCU:\Software\KeePass\Credentials"))
    { 
    Try
        {
        Write-Host -ForegroundColor Red "Credentials Path Not Found."
        New-Item -Path "HKCU:\Software\KeePass" -Name "Credentials" -Force 
        $SecurePassword = $Password | ConvertTo-SecureString -AsPlainText -Force 
        $SecurePasswordString = ConvertFrom-SecureString $SecurePassword 

        New-Item -Path HKCU:\Software\KeePass\Credentials\DB
        $SecurePasswordString = ConvertFrom-SecureString $SecurePassword 
        New-ItemProperty -Path HKCU:\Software\KeePass\Credentials\DB -PropertyType String -Name pass -Value $userNameString

        }
    Catch
        {
        [System.Exception]
        Write-Host -Foreground Red "Unable to create path."
        }
    Finally
        {
        }
    }



}


