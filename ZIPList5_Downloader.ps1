############### ZIPList5 ####################

#################### Set Variables ####################

# License string
$license            = "your_license"

# Release version
$release_version    = "latest"  

# Target directory - where you want to download files to; The default is current directory.
$target_directory   = Get-Location

# Program directory - where you put MelissaUpdater.exe; The default is current directory.
# Melissa Updater source code: https://github.com/MelissaData/MelissaUpdater
# Melissa Updater binary download link: https://releases.melissadata.net/Download/Library/WINDOWS/NET/ANY/latest/MelissaUpdater.exe
$program_directory  = "$target_directory\MelissaUpdater" 
$program_path       = "$program_directory\MelissaUpdater.exe" 



#################### Functions ####################
 
function Get-File {
    param (
      [parameter(Mandatory=$true)][String]$Filename,
      [parameter(Mandatory=$false)][String]$Type,
      [parameter(Mandatory=$true)][String]$OperatingSystem,
      [parameter(Mandatory=$true)][String]$Compiler,
      [parameter(Mandatory=$true)][String]$Architecture,
      [parameter(Mandatory=$true)][String]$TargetDirectory,
      [parameter(Mandatory=$false)][String]$WorkingDirectory
    )
       
    $path = "$target_directory\$TargetDirectory" 
    
    $verifyPath = "$target_directory\$TargetDirectory\$Filename"
    $params = "verify", "-p", "$verifyPath"
    & $program_path $params
    
    if($? -eq $False) {
      Invoke-Expression "$program_path file -f -n `"$Filename`" -r `"$release_version`" -l `"$license`" -y `"$Type`" -o `"$OperatingSystem`" -c `"$Compiler`" -a `"$Architecture`" -t `"$path`" " 
    } else {
      Invoke-Expression "$program_path file -n `"$Filename`" -r `"$release_version`" -l `"$license`" -y `"$Type`" -o `"$OperatingSystem`" -c `"$Compiler`" -a `"$Architecture`" -t `"$path`" " 
    }
}
  

function Get-Manifest {
    param (
      [parameter(Mandatory=$true)][String]$ProductName,
      [parameter(Mandatory=$true)][String]$TargetDirectory,
      [parameter(Mandatory=$false)][String]$WorkingDirectory
    )
       
    $path = "$target_directory\$TargetDirectory" 

    Invoke-Expression "$program_path manifest -p `"$ProductName`" -r `"$release_version`" -l `"$license`" -t `"$path`" " 
}



#################### Main ####################

###################
# Section 1: Data #
###################

# z5cbsa
$target_path = "Data\z5cbsa"
Get-Manifest -ProductName "zi_z5cbsa" -TargetDirectory $target_path

# z5lite
$target_path = "Data\z5lite"
Get-Manifest -ProductName "zi_z5lite" -TargetDirectory $target_path

# z5ll
$target_path = "Data\z5ll"
Get-Manifest -ProductName "zi_z5ll" -TargetDirectory $target_path

# z5ma
$target_path = "Data\z5ma"
Get-Manifest -ProductName "zi_z5ma" -TargetDirectory $target_path

# z5max
$target_path = "Data\z5max"
Get-Manifest -ProductName "zi_z5max" -TargetDirectory $target_path

# z5mcbsa
$target_path = "Data\z5mcbsa"
Get-Manifest -ProductName "zi_z5mcbsa" -TargetDirectory $target_path

# z5mm
$target_path = "Data\z5mm"
Get-Manifest -ProductName "zi_z5mm" -TargetDirectory $target_path

# z5msa
$target_path = "Data\z5msa"
Get-Manifest -ProductName "zi_z5msa" -TargetDirectory $target_path

# z5plus
$target_path = "Data\z5plus"
Get-Manifest -ProductName "zi_z5plus" -TargetDirectory $target_path

# ziplist5
$target_path = "Data\ziplist5"
Get-Manifest -ProductName "zi_ziplist5" -TargetDirectory $target_path
