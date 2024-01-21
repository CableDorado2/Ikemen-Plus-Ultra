# Copyright © 2008, Microsoft Corporation. All rights reserved.

########################### function library ############################

#########################################################################
# Function to show error message
#########################################################################
function Show-ErrorMessage([string]$message) 
{
    Write-Host -foregroundcolor Red "Error: $message"
}

#########################################################################
# Function to show info
#########################################################################
function Show-Information([string]$infoMessage) 
{
    Write-Host -foregroundcolor Green "Info: $infoMessage"
}

#########################################################################
# Function to get all language folder names
#########################################################################
function Get-languages([string]$rootDirectory)
{
    [HashTable]$languageFolderNameTable = New-Object -TypeName HashTable
    $languageFolders = Get-ChildItem $rootDirectory
    if(($languageFolders -ne $Null) -and ($languageFolders.Count -gt 0))
    {
        foreach($languageFolder in $languageFolders)
        {
            if ($languageFolder.GetType().Name -ieq "DirectoryInfo") 
            {
                if($languageFolder.Name -match "^[a-zA-Z]{2,3}-[a-zA-Z]{2,3}$")
                {
                    $languageFolderNameTable.Add($languageFolder.Name, $languageFolder.Name)
                }
            }
        }
    }
    return $languageFolderNameTable
}

#########################################################################
# Function to get TSPDesigner installation path
#########################################################################
function Get-InstallationPath
{
    [string]$registryKeyPath = "HKLM:\SOFTWARE\Microsoft\Microsoft SDKs\Windows\v7.0\WinSDKTools"
    $targetitem = Get-ItemProperty -Path $registryKeyPath -Name "InstallationFolder" -ErrorAction SilentlyContinue
    return $targetitem.InstallationFolder
}

#########################################################################
# Function to get SDMC command
#########################################################################
function Get-SMDCCommand
{
    [string]$installationPath = Get-InstallationPath
    if(-not[string]::IsNullOrEmpty($installationPath))
    {
        [string]$sdmcPath = Join-Path -Path $installationPath -ChildPath "TSPDesigner\SDMC.exe"
        if(Test-Path $sdmcPath)
        {
            $sdmcCommand = Get-Command $sdmcPath
        }
    }
    
    if($sdmcCommand -eq $Null)
    {
        if(Test-Path ".\SDMC.exe")
        {
            $sdmcCommand = Get-Command ".\SDMC.exe"
        }
    }
    
    return $sdmcCommand
}

#########################################################################
# Function to get sdcatalog command
#########################################################################
function Get-SDCATALOGCommand
{
    [string]$installationPath = Get-InstallationPath
    if(-not[string]::IsNullOrEmpty($installationPath))
    {
        [string]$sdcatalogPath = Join-Path -Path $installationPath -ChildPath "TSPDesigner\sdcatalog.exe"
        if(Test-Path $sdcatalogPath)
        {
            $sdcatalogCommand = Get-Command $sdcatalogPath
        }
    }
    
    if($sdcatalogCommand -eq $Null)
    {
        if(Test-Path ".\sdcatalog.exe")
        {
            $sdcatalogCommand = Get-Command ".\sdcatalog.exe"
        }
    }
    
    return $sdcatalogCommand
}

#########################################################################
# Function to get the diag package Id
#########################################################################
function Get-DiagPackageId([string]$pkgPath) 
{
    $diagFileInfo = Get-DiagFileInfo $pkgPath "*.diagpkg"
    if([string]::IsNullOrEmpty($diagFileInfo.FullName))
    {
        return $Null
    }
	
    [xml]$diagXml = Get-Content -Path $diagFileInfo.FullName
    return $diagxml.SelectSingleNode("//DiagnosticIdentification").Id
}

#########################################################################
# Function to get diag file name
#########################################################################
function Get-DiagFileInfo([string]$pkgPath, [string]$filter)
{
    $diagpkgFile = @(Get-ChildItem -LiteralPath $pkgPath -Filter $filter -Force)
    if(($null -eq $diagpkgFile) -or (1 -ne $diagpkgFile.Count)) 
    {
        Show-ErrorMessage "The package in $pkgPath should only contains one .diag file"
        return $Null
    }
    
    return $diagpkgFile[0]
}

#########################################################################
# Function to create a subfolder
#########################################################################
function Get-Subfolder([string]$parentDirectory, [string]$subfolderName)
{
    $parentPath = Resolve-Path $parentDirectory
    [string]$fullPath = Join-Path -Path $parentPath.Path -ChildPath $subfolderName
    if (-not(Test-Path $fullPath)) 
    {
        New-Item -Type directory -Path $fullPath | Out-Null
    }
    return $fullPath
}

#########################################################################
# Function to create a package output folder
#########################################################################
function Get-PackageOutputfolder([string]$packageFolder)
{
    [string]$outputFolderName = "Output"
    $packageOutputPath = Get-Subfolder $packageFolder $outputFolderName
    if (-not(Test-Path $packageOutputPath))
    {
        Show-ErrorMessage "Failed to create new output folder : $packageOutputPath"
    }
    else
    {
        Show-Information "Package output folder : $packageOutputPath"
    } 
    
    return $packageOutputPath
}

#########################################################################
# Function to create the compiled pack folder in output folder
#########################################################################
function Get-CompiledPackfolder([string]$packageOutputFolder)
{
    [string]$compiledPackFolderName = "Compiledpack"
    $compiledPackPath = Get-Subfolder $packageOutputFolder $compiledPackFolderName
    if (-not(Test-Path $compiledPackPath))
    {
        Show-ErrorMessage "Failed to create new compiled pack folder : $compiledPackPath"
    }
    else
    {
        Show-Information "Package compiled folder : $compiledPackPath"
    } 
    
    return $compiledPackPath
}

#########################################################################
# Function to create the cab folder in output folder
#########################################################################
function Get-DiagnostiCabfolder([string]$packageOutputFolder)
{
    [string]$DiagnosticCabFolderName = "Diagcab"
    $diagnosticCabPath = Get-Subfolder $packageOutputFolder $DiagnosticCabFolderName
    if (-not(Test-Path $diagnosticCabPath))
    {
        Show-ErrorMessage "Failed to create new diagnostic cab folder : $diagnosticCabPath"
    }
    else
    {
        Show-Information "Diagnostic cab folder : $diagnosticCabPath"
    } 
    
    return $diagnosticCabPath
}

#########################################################################
# Function to get code sign certificate
#########################################################################
function Get-Certificate([string]$PFXFileName)
{
    $codesigncert = $Null
    if (-not([string]::IsNullOrEmpty($PFXFileName)))
    {
        $PFXFileFullName = Resolve-Path $PFXFileName
        if ((Test-Path $PFXFileFullName.Path) -eq $True)
        {
            Show-Information "Import codesigning certificate from $PFXFileFullName"
            $codesigncert = Get-PfxCertificate -FilePath $PFXFileFullName.Path
            if( $codesigncert -eq $Null)
            {
                Show-ErrorMessage "Can't get certificate from PFX file: $PFXFileFullName"
            }
        }
    }
    
    if( $codesigncert -eq $Null)
    {
        Show-Information "Get code signing certificate from cert:\CurrentUser\My"
        $codesigncert = @(Get-ChildItem cert:\CurrentUser\My -CodeSigningCert)[0]
    }
    
    return $codesigncert
}

#########################################################################
# Function to get default time stamp server
#########################################################################
function Get-DefaultTimeStampServer
{
    return "http://timestamp.verisign.com/scripts/timstamp.dll"
}

#########################################################################
# Function to compile package with sdmc
#########################################################################
function Compile-DiagnosticPackage($sdmcCommand, $packageSourcePath, $packagecompiledPath, $language)
{
    $compileResult = $True
    
    $diagFileInfo = Get-DiagFileInfo $packageSourcePath "*.diag"
    if( $diagFileInfo -eq $Null)
    {
        return $False
    }
    
    [string]$projectFileName = Join-Path -Path $packageSourcePath -ChildPath "ProjectFile.Xml"
    if( -not(Test-Path $projectFileName))
    {
        Show-ErrorMessage "ProjectFile.xml in not found in $packageSourcePath"
        return $False
    }
    
    if([String]::IsNullOrEmpty($language)) 
    {
        & $sdmc -sdk -f $diagFileInfo.FullName -o $packagecompiledPath -pf $projectFileName| Out-Null
    }
    else 
    {
        & $sdmc -sdk -f $diagFileInfo.FullName -l $language -o $packagecompiledPath -pf $projectFileName | Out-Null
    }

    if(0 -ne $LASTEXITCODE) 
    {
        Show-ErrorMessage "Compile pakage failed"
        $compileResult = $False
    }
    
    return $compileResult
}

#########################################################################
# Function to catalog the package
#########################################################################
function Catalog-DiagnosticPackage($catalogCommand, $packagecompiledPath, $language)
{
    if(-not([String]::IsNullOrEmpty($language))) 
    {
        [string]$packageId = Get-DiagPackageId $packagecompiledPath
        if([string]::IsNullOrEmpty($packageId)) 
        {
            Show-ErrorMessage "No package id found"
	        return $False
        }

        & $catalogCommand -r $packagecompiledPath -i $packageId -l $language | Out-Null
    }
    else
    {
        & $catalogCommand -r $packagecompiledPath | Out-Null
    }
    
    if(0 -ne $LASTEXITCODE) 
    {
        Show-ErrorMessage "catalog pakage failed"
        return $False
    }
    
    return $True
}

#########################################################################
# Function to sign a localized cat file for a specific language
#########################################################################
Function Sign-LocalizedPack([string]$compiledFolder, [string]$language, $codesigncert, $timestampserver)
{
    if([String]::IsNullOrEmpty($language)) 
    {
        Show-ErrorMessage "No language specified"
        return $False
    }
    
    $compiledPath = Resolve-Path $compiledFolder
    [string]$languageCatFile = Join-Path -Path $compiledPath.Path -ChildPath "$language\$language.cat"
    if(-not(Test-Path $languageCatFile))
    {
        Show-ErrorMessage "Can not find localized cat file : $languageCatFile "
        return $False
    }
        
    Set-AuthenticodeSignature -FilePath $languageCatFile -Certificate $codesigncert -timestampserver $timestampserver | Out-Null
         
    if(0 -ne $LASTEXITCODE) 
    {
        Show-ErrorMessage "sign package failed"
        return $False
    }
        
    return $True
}

#########################################################################
# Function to show the usage of CompileAndCabDiagPack.ps1
#########################################################################
function Show-Usage 
{
    Write-Host -foregroundcolor Green ".\CompileAndCabDiagPack.ps1 <PackagePath>, [optional PackageOutput], [optional Language], [optional TimeStampServer], [optional PFXFileName]"
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green "Please note that if you have a PFX file and want to use your own certificate, you need to supply the optional parameters."
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green "---------------------------- Example 1 ----------------------------"
    Write-Host -foregroundcolor Green ".\CompileAndCabDiagPack.ps1 C:\AeroPackage "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " Description"
    Write-Host -foregroundcolor Green " ------------"
    Write-Host -foregroundcolor Green " Specify the package source path, this script will help you to compile and create cab file in the default folders"
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green "---------------------------- Example 2 ----------------------------"
    Write-Host -foregroundcolor Green ".\CompileAndCabDiagPack.ps1 C:\AeroPackage C:\Output en-us"
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " Description"
    Write-Host -foregroundcolor Green " ------------"
    Write-Host -foregroundcolor Green " The script will help you to compile and create cab file only for language 'en-us'. The compiled file and cab file will be saved to the output folder."
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green "---------------------------- Example 3 ----------------------------"
    Write-Host -foregroundcolor Green ".\CompileAndCabDiagPack.ps1 C:\AeroPackage C:\Output en-us http://timestamp.verisign.com/scripts/timstamp.dll C:\test.pfx"
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " Description"
    Write-Host -foregroundcolor Green " ------------"
    Write-Host -foregroundcolor Green " After the package compiled, it will be signed by the specific time stamp server and the pfx file."
    Write-Host -foregroundcolor Green " "
}

#########################################################################
# Function to show the usage of CompileDiagPack.ps1
#########################################################################
function Show-CompilingUsage 
{
    Write-Host -foregroundcolor Green ".\CompileDiagPack.ps1 <PackagePath>, [optional PackageOutput], [optional Language], [optional TimeStampServer], [optional PFXFileName]"
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green "Please note that if you have a PFX file and want to use your own certificate, you need to supply the optional parameters."
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green "---------------------------- Example 1 ----------------------------"
    Write-Host -foregroundcolor Green ".\CompileDiagPack.ps1 C:\AeroPackage "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " Description"
    Write-Host -foregroundcolor Green " ------------"
    Write-Host -foregroundcolor Green " Specify the package source path, this script will help you to compile and create cat file in the default folders"
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green "---------------------------- Example 2 ----------------------------"
    Write-Host -foregroundcolor Green ".\CompileDiagPack.ps1 C:\AeroPackage C:\Output en-us"
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " Description"
    Write-Host -foregroundcolor Green " ------------"
    Write-Host -foregroundcolor Green " The script will help you to compile and create cat file only for language 'en-us'. The compiled file and cat file will be saved to the output folder."
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green "---------------------------- Example 3 ----------------------------"
    Write-Host -foregroundcolor Green ".\CompileDiagPack.ps1 C:\AeroPackage C:\Output en-us http://timestamp.verisign.com/scripts/timstamp.dll C:\test.pfx"
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " Description"
    Write-Host -foregroundcolor Green " ------------"
    Write-Host -foregroundcolor Green " After the package compiled, it will be signed by the specific time stamp server and the pfx file."
    Write-Host -foregroundcolor Green " "
}

#########################################################################
# Function to show the usage of CabDiagPack.ps1
#########################################################################
function Show-CreateCabUsage 
{
    Write-Host -foregroundcolor Green ".\CabDiagPack.ps1 <PackageCompiledPath>, [optional CabFilePath], [optional TimeStampServer], [optional PFXFileName]"
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green "Please note that if you have a PFX file and want to use your own certificate, you need to supply the optional parameters."
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green "---------------------------- Example 1 ----------------------------"
    Write-Host -foregroundcolor Green ".\CabDiagPack.ps1 C:\AeroPackage\Output\Compiledpack "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " Description"
    Write-Host -foregroundcolor Green " ------------"
    Write-Host -foregroundcolor Green " The script will help to creat a cab file for the compiled files"
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green "---------------------------- Example 2 ----------------------------"
    Write-Host -foregroundcolor Green ".\CabDiagPack.ps1 C:\AeroPackage\Output\Compiledpack C:\cabs http://timestamp.verisign.com/scripts/timstamp.dll C:\test.pfx"
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " Description"
    Write-Host -foregroundcolor Green " ------------"
    Write-Host -foregroundcolor Green " The script will help to creat a cab file for the compiled files and save them to the output folder. The cab will be signed by the specific time stamp server and the pfx file. "
    Write-Host -foregroundcolor Green " "
    Write-Host -foregroundcolor Green " "
}

#########################################################################
# Function to catalog and sign the package
#########################################################################
function CatalogAndSignLocalizedPack([string]$compiledPackPath, $codesigncert, [string]$timestampserver)
{
    $sdcatalog = Get-SDCATALOGCommand
    if($sdcatalog -eq $Null)
    {
        Show-ErrorMessage "SDCATALOG hasn't been installed"
        return
    }
    
    #
    # Pick up all language names under compiled package folder
    #
    [HashTable]$languageFolderNameTable = Get-languages $compiledPackPath
    if(($languageFolderNameTable -eq $Null) -or ($languageFolderNameTable.Count -eq 0))
    {
        Show-Information "No localization language folder found."
        return
    }

    #
    # Catalog and sign localized package for different languages
    #
    foreach($language in $languageFolderNameTable.Keys)
    {
        Catalog-DiagnosticPackage $sdcatalog $compiledPackPath $language | Out-Null
    
        Sign-LocalizedPack $compiledPackPath $language $codesigncert $timestampserver | Out-Null
    }
}
# SIG # Begin signature block
# MIIa+wYJKoZIhvcNAQcCoIIa7DCCGugCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUpfbsli1lOUG5f1yZq/AsX7Q3
# V+WgghXYMIIEhTCCA22gAwIBAgIKYQX3HgAAAAAAMjANBgkqhkiG9w0BAQUFADB5
# MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVk
# bW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSMwIQYDVQQDExpN
# aWNyb3NvZnQgQ29kZSBTaWduaW5nIFBDQTAeFw0wOTA3MTMyMzAwMThaFw0xMDEw
# MTMyMzEwMThaMIGDMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQ
# MA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9u
# MQ0wCwYDVQQLEwRNT1BSMR4wHAYDVQQDExVNaWNyb3NvZnQgQ29ycG9yYXRpb24w
# ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC1jKmclIRhGswuIsSgk2QJ
# 3oWhsJBd/MlsaLXx7/yOa/T4oG7XUd5goydj1PbftkzSRQunPdhv/u2nGGPTH8aB
# 1L8HN5dAK3/nX1o12ZNPq/MqkvCmjYHsBSTc27hhY1NhAjU41rj17ntUpslYNen0
# Fe/aB2wFLU2ktrqbO7gxMH5FvKmhJTkMQ6RHO5ecIERyN89QoE1N9MNl3ETRCDs4
# 3T7FF2xGx61zJMCPicHq6rrNaKkS1lgMUxYM/jkD1oHyPlxX83rbZuEHGNkZAxT2
# 5kWZKlFMkNda76+3OwwpTW0grge3ki7oacqfMELnwzKKCyJKMuicDMZRAyYBbZJz
# AgMBAAGjggECMIH/MBMGA1UdJQQMMAoGCCsGAQUFBwMDMB0GA1UdDgQWBBSHgbff
# 7vp3+lkFYzcECtfp2qDg4DAOBgNVHQ8BAf8EBAMCB4AwHwYDVR0jBBgwFoAUV0V0
# HF2w9shDBeCMVC2PMqf+SJYwSQYDVR0fBEIwQDA+oDygOoY4aHR0cDovL2NybC5t
# aWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVjdHMvQ29kZVNpZ1BDQS5jcmwwTQYI
# KwYBBQUHAQEEQTA/MD0GCCsGAQUFBzAChjFodHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpL2NlcnRzL0NvZGVTaWdQQ0EuY3J0MA0GCSqGSIb3DQEBBQUAA4IBAQA2
# IYT1j4MhTYeoP4vnxaQPTDBuWXSbC5d0Fqmx83Ckr8IMMyTzoEr6weQhxrbZ6lxb
# kWH3Im3/MfwXTtfNQOOd0uW00vqNbAfad5rKK+4NWUfPBMIQZ/rq6UM7t+bRnNmO
# I2BuEpvD2X5cVzLdlA3ffcVIkk1IdreiwFOVPvw6o5N88oUEx8aFOJc2+BKTIgCZ
# TnmvlutaIIOs0FxaMLAA4ms5jySJ2j0MpEZ5YjZTatfJzZII+4flVPV8WcXEd32w
# wSyYx5dsQ6f4IPiDVGSeYPjiSqVn1Em/VIh9UkTzUcAm0cV88InWEQkowkVFgB2Q
# Ir2OogU+PLNPvdc54IiTMIIEuzCCA6OgAwIBAgIKYQTKaQAAAAAACDANBgkqhkiG
# 9w0BAQUFADB3MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
# A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSEw
# HwYDVQQDExhNaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EwHhcNMDcwNjA1MjIwMzIx
# WhcNMTIwNjA1MjIxMzIxWjCBpDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hp
# bmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jw
# b3JhdGlvbjEnMCUGA1UECxMebkNpcGhlciBEU0UgRVNOOkE1QjAtQ0RFMC1EQzk0
# MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIIBIjANBgkq
# hkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAr/ha9jSxog+OrM/8GPCtJQ1xu19btzs3
# QRMkHOojxa6smcDcpiPwyqkzMDJqL5ohQgIJJlmbUOlXcYtn65foBHOLeLGYQEaj
# WgEoABag2sVOi6kJVJExnP/EkJVFBx2AKAUGcYDLrDhnYezCXxadf7A/0Sr3Mm9z
# PXxumDaahu4AOO4X7E9VM0aBekDcpfXSI4ZdKzNPJEiTGrG0fs/fMxu/1VvGLxPz
# 5oS3TpOYvADrXB1pxcjI0sQ8sAAU47Kc+aEeCdzV9W18MjEzso9Zm/7KH10iTroS
# HfBnwwSJS38D/X3XVIEDXUn1HqsgftJltHEZ6Ex9xpS9hZFtUFrDqQIDAQABo4IB
# GTCCARUwHQYDVR0OBBYEFJ6PqHTBQu4YzT296dbuJ7DHNTRnMB8GA1UdIwQYMBaA
# FCM0+NlSRnAK7UD7dvuzK7DDNbMPMFQGA1UdHwRNMEswSaBHoEWGQ2h0dHA6Ly9j
# cmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY3Jvc29mdFRpbWVT
# dGFtcFBDQS5jcmwwWAYIKwYBBQUHAQEETDBKMEgGCCsGAQUFBzAChjxodHRwOi8v
# d3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY3Jvc29mdFRpbWVTdGFtcFBD
# QS5jcnQwEwYDVR0lBAwwCgYIKwYBBQUHAwgwDgYDVR0PAQH/BAQDAgbAMA0GCSqG
# SIb3DQEBBQUAA4IBAQBnpd8oUdxIg/3GZfld+maqso2nVp2iSL4yrG2XD08MRLu7
# GPSQ5+J9xXQA1obzkcDQ0QWJXmKL+mj3Zc/mU6nfdBIhrYwVtKbKQ5PJa+FKsu0P
# zrSKOn/3tcy8Epp7zwTEP9kKLHU8kp7PBjZiDgIX5pkn9/tx7/9aemFVurqYh+tx
# rHb16IafNmdQQXj8M6TVaXMByHAja3yjV8hoB+RbQcH4Jv1pSQOZ1q/JP6T1nEz5
# Cp3SzUu/ffoWkOw7cUn+BBXK4mraaQu0kz40/srsgEnksnQYzJHnPk63e/VAj2Rb
# 1FDVOU1Tzb7UXkeCW9FaepkuRnBrB4UNbAkTYw91MIIGBzCCA++gAwIBAgIKYRZo
# NAAAAAAAHDANBgkqhkiG9w0BAQUFADBfMRMwEQYKCZImiZPyLGQBGRYDY29tMRkw
# FwYKCZImiZPyLGQBGRYJbWljcm9zb2Z0MS0wKwYDVQQDEyRNaWNyb3NvZnQgUm9v
# dCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkwHhcNMDcwNDAzMTI1MzA5WhcNMjEwNDAz
# MTMwMzA5WjB3MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
# A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSEw
# HwYDVQQDExhNaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EwggEiMA0GCSqGSIb3DQEB
# AQUAA4IBDwAwggEKAoIBAQCfoWyx39tIkip8ay4Z4b3i48WZUSNQrc7dGE4kD+7R
# p9FMrXQwIBHrB9VUlRVJlBtCkq6YXDAm2gBr6Hu97IkHD/cOBJjwicwfyzMkh53y
# 9GccLPx754gd6udOo6HBI1PKjfpFzwnQXq/QsEIEovmmbJNn1yjcRlOwhtDlKEYu
# J6yGT1VSDOQDLPtqkJAwbofzWTCd+n7Wl7PoIZd++NIT8wi3U21StEWQn0gASkdm
# EScpZqiX5NMGgUqi+YSnEUcUCYKfhO1VeP4Bmh1QCIUAEDBG7bfeI0a7xC1Un68e
# eEExd8yb3zuDk6FhArUdDbH895uyAc4iS1T/+QXDwiALAgMBAAGjggGrMIIBpzAP
# BgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBQjNPjZUkZwCu1A+3b7syuwwzWzDzAL
# BgNVHQ8EBAMCAYYwEAYJKwYBBAGCNxUBBAMCAQAwgZgGA1UdIwSBkDCBjYAUDqyC
# YEBWJ5flJRP8KuEKU5VZ5KShY6RhMF8xEzARBgoJkiaJk/IsZAEZFgNjb20xGTAX
# BgoJkiaJk/IsZAEZFgltaWNyb3NvZnQxLTArBgNVBAMTJE1pY3Jvc29mdCBSb290
# IENlcnRpZmljYXRlIEF1dGhvcml0eYIQea0WoUqgpa1Mc1j0BxMuZTBQBgNVHR8E
# STBHMEWgQ6BBhj9odHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9k
# dWN0cy9taWNyb3NvZnRyb290Y2VydC5jcmwwVAYIKwYBBQUHAQEESDBGMEQGCCsG
# AQUFBzAChjhodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY3Jv
# c29mdFJvb3RDZXJ0LmNydDATBgNVHSUEDDAKBggrBgEFBQcDCDANBgkqhkiG9w0B
# AQUFAAOCAgEAEJeKw1wDRDbd6bStd9vOeVFNAbEudHFbbQwTq86+e4+4LtQSooxt
# YrhXAstOIBNQmd16QOJXu69YmhzhHQGGrLt48ovQ7DsB7uK+jwoFyI1I4vBTFd1P
# q5Lk541q1YDB5pTyBi+FA+mRKiQicPv2/OR4mS4N9wficLwYTp2OawpylbihOZxn
# LcVRDupiXD8WmIsgP+IHGjL5zDFKdjE9K3ILyOpwPf+FChPfwgphjvDXuBfrTot/
# xTUrXqO/67x9C0J71FNyIe4wyrt4ZVxbARcKFA7S2hSY9Ty5ZlizLS/n+YWGzFFW
# 6J1wlGysOUzU9nm/qhh6YinvopspNAZ3GmLJPR5tH4LwC8csu89Ds+X57H2146So
# dDW4TsVxIxImdgs8UoxxWkZDFLyzs7BNZ8ifQv+AeSGAnhUwZuhCEl4ayJ4iIdBD
# 6Svpu/RIzCzU2DKATCYqSCRfWupW76bemZ3KOm+9gSd0BhHudiG/m4LBJ1S2sWo9
# iaF2YbRuoROmv6pH8BJv/YoybLL+31HIjCPJZr2dHYcSZAI9La9Zj7jkIeW1sMpj
# tHhUBdRBLlCslLCleKuzoJZ1GtmShxN1Ii8yqAhuoFuMJb+g74TKIdbrHk/Jmu5J
# 4PcBZW+JC33Iacjmbuqnl84xKf8OxVtc2E0bodj6L54/LlUWa8kTo/0wggaBMIIE
# aaADAgECAgphFQgnAAAAAAAMMA0GCSqGSIb3DQEBBQUAMF8xEzARBgoJkiaJk/Is
# ZAEZFgNjb20xGTAXBgoJkiaJk/IsZAEZFgltaWNyb3NvZnQxLTArBgNVBAMTJE1p
# Y3Jvc29mdCBSb290IENlcnRpZmljYXRlIEF1dGhvcml0eTAeFw0wNjAxMjUyMzIy
# MzJaFw0xNzAxMjUyMzMyMzJaMHkxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xIzAhBgNVBAMTGk1pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBMIIB
# IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAn43fhTeMsQZWZjZO1ArrNiOR
# Hq+rjVjpxM/BnzoKJMTExF6w7hUUxfo+mTNrGWly9HwFX+WZJUTXNRmKkNwojpAM
# 79WQYa3e3BhwLYPJb6+FLPjdubkw/XF4HIP9yKm5gmcNerjBCcK8FpdXPxyY02nX
# MJCQkI0wH9gm1J57iNniCe2XSUXrBFKBdXu4tSK4Lla718+pTjwKg6KoOsWttgEO
# as8itCMfbNUn57d+wbTVMq15JRxChuKdhfRX2htZLy0mkinFs9eFo55gWpTme5x7
# XoI0S23/1O4n0KLc0ZAMzn0OFXyIrDTHwGyYhErJRHloKN8igw24iixIYeL+EQID
# AQABo4ICIzCCAh8wEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFFdFdBxdsPbI
# QwXgjFQtjzKn/kiWMAsGA1UdDwQEAwIBxjAPBgNVHRMBAf8EBTADAQH/MIGYBgNV
# HSMEgZAwgY2AFA6sgmBAVieX5SUT/CrhClOVWeSkoWOkYTBfMRMwEQYKCZImiZPy
# LGQBGRYDY29tMRkwFwYKCZImiZPyLGQBGRYJbWljcm9zb2Z0MS0wKwYDVQQDEyRN
# aWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHmCEHmtFqFKoKWtTHNY
# 9AcTLmUwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC5taWNyb3NvZnQuY29t
# L3BraS9jcmwvcHJvZHVjdHMvbWljcm9zb2Z0cm9vdGNlcnQuY3JsMFQGCCsGAQUF
# BwEBBEgwRjBEBggrBgEFBQcwAoY4aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3Br
# aS9jZXJ0cy9NaWNyb3NvZnRSb290Q2VydC5jcnQwdgYDVR0gBG8wbTBrBgkrBgEE
# AYI3FS8wXjBcBggrBgEFBQcCAjBQHk4AQwBvAHAAeQByAGkAZwBoAHQAIACpACAA
# MgAwADAANgAgAE0AaQBjAHIAbwBzAG8AZgB0ACAAQwBvAHIAcABvAHIAYQB0AGkA
# bwBuAC4wEwYDVR0lBAwwCgYIKwYBBQUHAwMwDQYJKoZIhvcNAQEFBQADggIBADC8
# sCCkYqCn7zkmYT3crMaZ0IbELvWDMmVeIj6b1ob46LafyovWO3ULoZE+TN1kdIxJ
# 8oiMGGds/hVmRrg6RkKXyJE31CSx56zT6kEUg3fTyU8FX6MUUr+WpC8+VlsQdc5T
# w84FVGm0ZckkpQ/hJbgauU3lArlQHk+zmAwdlQLuIlmtIssFdAsERXsEWeDYD7Pr
# TPhg3cJ4ntG6n2v38+5+RBFA0r26m0sWCG6kvlXkpjgSo0j0HFV6iiDRff6R25SP
# L8J7a6ZkhU+j5Sw0KV0Lv/XHOC/EIMRWMfZpzoX4CpHs0NauujgFDOtuT0ycAymq
# ovwYoCkMDVxcViNX2hyWDcgmNsFEy+Xh5m+J54/pmLVz03jj7aMBPHTlXrxs9iGJ
# ZwXsl521sf2vpulypcM04S+f+fRqOeItBIJb/NCcrnydEfnmtVMZdLo5SjnrfUKz
# Sjs3PcJKeyeY5+JOmxtKVDhqIze+ardI7upCDUkkkY63BC6Xb+TnRbuPTf1g2ddZ
# wtiA1mA0e7ehkyD+gbiqpVwJ6YoNvihNftfoD+1leNExX7lm299C5wvMAgeN3/8g
# BqNFZbSzMo0ukeJNtKnJ+rxrBA6yn+qf3qTJCpb0jffYmKjwhQIIWaQgpiwLGvJS
# Bu1p5WQYG+Cjq97KfBRhQ7hl9TajVRMrZyxNGzBMMYIEjTCCBIkCAQEwgYcweTEL
# MAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1v
# bmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEjMCEGA1UEAxMaTWlj
# cm9zb2Z0IENvZGUgU2lnbmluZyBQQ0ECCmEF9x4AAAAAADIwCQYFKw4DAhoFAKCB
# ujAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgorBgEEAYI3AgELMQ4wDAYK
# KwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQU9tmu7ELhCHxZTeRvh5NE5EEp7dIw
# WgYKKwYBBAGCNwIBDDFMMEqgLIAqAE0AaQBjAHIAbwBzAG8AZgB0ACAAQwBvAHIA
# cABvAHIAYQB0AGkAbwBuoRqAGGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbTANBgkq
# hkiG9w0BAQEFAASCAQCNzVh7PkZWQWT1bDsRK31yV/t6+s7bfwngIiuPLy+ET8pr
# G3rnovuS5OACwduaRIt3NK9wNT4SQaiHEK44tVBBrg+Zek652Hv6WNm3wMvbnmim
# G2XXjAZDbwFl1se/IsTOpuwEmRGJvu0hK+Pr3expzovNe7e9QdUqB6IyZDLp4hqc
# xi7PZFbgRDiyvQb+riyxQ0mx68MGsR6rHTJElpWmVG74t/F50YzvKIrboXfOj7NX
# zsMt1ZqUTfWRwRRyci8rstH7MMUxhgsGbyqBXLExlrnbu1fk4GCjQqv6JwYtXUGu
# xJQSU/8sM5cqBUEPCa2xN2G3/2nJ7GTJlINYh0wzoYICHTCCAhkGCSqGSIb3DQEJ
# BjGCAgowggIGAgEBMIGFMHcxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xITAfBgNVBAMTGE1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQQIKYQTKaQAA
# AAAACDAHBgUrDgMCGqBdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
# hvcNAQkFMQ8XDTA5MTAyMzA1MjA0MVowIwYJKoZIhvcNAQkEMRYEFMW35ZyPX219
# ERsMFgKbEfod8yH7MA0GCSqGSIb3DQEBBQUABIIBADgcaE/eJWfoOHSBfiZePRod
# cilYXKStG/BNtk3JkgGGUNug4A0X+lyY4SHTSPqOET6jTJvejmQpYgkExsotHNG5
# w+Z/GboPwo3k5k339rIWBhQYJzNZGcfY+1UGEdD12dRYaacSSXyvo+Q/dBqkDGSu
# HDqay+ckE7UnfRLByNLGK71Sy7rxl9g50nVh9jmJiK50G5mgCJqyM+DOMqnv/Wo0
# JISrdY6MFWAHAhvpDTjm/WzX9R8BZz2y55DH4vVLKYqJoLsFf8PApmbmKJhWT7VZ
# LcvUBSwyJqr/LIejGyKXg5+okByOZQpfd6d+ICZfwN9BsrGsoGLzuq19bgAsRfE=
# SIG # End signature block
