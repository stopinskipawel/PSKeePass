cd "C:\Program Files (x86)\KeePass Password Safe 2\"
$db =  'C:\KeePassDB\pstopinski_local.kdbx'
clear


$DBPassword = '01000000d08c9ddf0115d1118c7a00c04fc297eb01000000cda926a0f7a1564a83872a340a96d0910000000002000000000010660000000100002000000031c975a7ff608f64e26694fda4042bbaf782d3543865bc5c259d3962c2fbe124000000000e80000000020000200000002ac7e8063eb43d3cf9ea5bb3f3c992c131555c8a665a8951a81c59ec010d4a7520000000e980d423c493f09b9858839cad58249aa489b877d681eb60f66fd264867a87e34000000095306ab3768f9b98d320cc3cac26e6f5da00a9a1c23ac6425f212541dd3fde4ffd509572df5fcdc409c536ea7ca7c3e268f1b6410062665b83ebd134d23c591a'

$Password = $DBPassword | ConvertTo-SecureString

$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($Password)
$PlainPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)



$KeepassAppPath = "C:\Program Files (x86)\KeePass Password Safe 2\"


    $PathKPScript = $KeepassAppPath+"keepass.exe"   
    $arguments = ' -pw:"{0}" "{1}"' -f $PlainPassword, $DB

 Start-Process -FilePath $PathKPScript $arguments -WindowStyle Minimized
