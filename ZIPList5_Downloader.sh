#!/bin/bash
############### ZIPList5 ####################

#################### Set Variables ####################

# License string
license="your_license"

# Release version
release_version="latest"  

# Target directory - where you want to download files to; The default is current directory.
target_directory=$(pwd)

# Program directory - where you put MelissaUpdater; The default is current directory.
# Melissa Updater source code: https://github.com/MelissaData/MelissaUpdater
# Melissa Updater binary download link: https://releases.melissadata.net/Download/Library/LINUX/NET/ANY/latest/MelissaUpdater
program_directory="$target_directory/MelissaUpdater"
program_path="$program_directory/MelissaUpdater"


#################### Functions ####################
 
Get-File() 
{
    path="$target_directory/$6" 
    
    verifyPath="$target_directory/$6/$1"
    $program_path verify --path $verifyPath
    
    if [ $? -eq 0 ];
    then
        eval "$program_path file --filename $1 --release_version $release_version --license $license --type $2 --os $3 --compiler $4 --architecture $5 --target_directory $path "
    else
        eval "$program_path file --force --filename $1 --release_version $release_version --license $license --type $2 --os $3 --compiler $4 --architecture $5 --target_directory $path "
    fi
}

Get-Manifest() 
{
    path="$target_directory/$2"
    
    eval "$program_path manifest --product $1 --release_version $release_version --license $license --target_directory $path "
}

#################### Main ####################

###################
# Section 1: Data #
###################

# z5cbsa
target_path="Data/z5cbsa"
Get-Manifest "zi_z5cbsa" $target_path

# z5lite
target_path="Data/z5lite"
Get-Manifest "zi_z5lite" $target_path

# z5ll
target_path="Data/z5ll"
Get-Manifest "zi_z5ll" $target_path

# z5ma
target_path="Data/z5ma"
Get-Manifest "zi_z5ma" $target_path

# z5max
target_path="Data/z5max"
Get-Manifest "zi_z5max" $target_path

# z5mcbsa
target_path="Data/z5mcbsa"
Get-Manifest "zi_z5mcbsa" $target_path

# z5mm
target_path="Data/z5mm"
Get-Manifest "zi_z5mm" $target_path

# z5msa
target_path="Data/z5msa"
Get-Manifest "zi_z5msa" $target_path

# z5plus
target_path="Data/z5plus"
Get-Manifest "zi_z5plus" $target_path

# ziplist5
target_path="Data/ziplist5"
Get-Manifest "zi_ziplist5" $target_path
