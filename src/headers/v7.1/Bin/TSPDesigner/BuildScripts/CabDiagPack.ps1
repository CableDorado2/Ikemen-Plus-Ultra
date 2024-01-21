# Copyright © 2008, Microsoft Corporation. All rights reserved.

PARAM([string]$packageCompiledFolder="", [string]$cabFilePath, [string]$timestampServer="", [string]$pfxFileName="")

. .\CL_Utility.ps1

if ($packageCompiledFolder -ieq "/?") 
{
    Show-CreateCabUsage
    return
}

#
# Resolve input and output folders
#
if([string]::IsNullOrEmpty($packageCompiledFolder))
{
    Show-ErrorMessage "Package output folder is not specified"
    return
}

if (-not(Test-Path $packageCompiledFolder)) 
{
    Show-ErrorMessage "The path $packageOutputFolder doesn't exist"
    return
}

$compiledPackPath = (Resolve-Path $packageCompiledFolder).Path

if([string]::IsNullOrEmpty($cabFilePath))
{
    $cabFilePath = Get-DiagnostiCabfolder (Split-Path $compiledPackPath)
}
else
{
    if (-not(Test-Path $cabFilePath)) 
    {
        Show-ErrorMessage "The path $cabFilePath doesn't exist"
        return
    }
    else
    {
        $cabFilePath = (Resolve-Path $cabFilePath).Path
    }
}

Show-Information "Begin to generate cab file for package : $compiledPackPath"


if( [string]::IsNullOrEmpty($timestampServer))
{
    $timestampServer = Get-DefaultTimeStampServer
}

#
# Re-catalog and sign the packages for all languages.
# User may add some mui files manually after compiling, then he runs this script to create the cab file.
# At this time, we should help him to catalog and sign these files.
#
$codeSignCertificate = Get-Certificate $pfxFileName

if( $codeSignCertificate -eq $Null)
{
    Show-ErrorMessage "No available certificate found"
    return
}

CatalogAndSignLocalizedPack $compiledPackPath $codeSignCertificate $timestampserver

#
# Generate cab file for all languages
#
$diagpkgFile = @(Get-ChildItem -LiteralPath $compiledPackPath -Filter "*.diagpkg" -Force)
if(($null -eq $diagpkgFile) -or (1 -ne $diagpkgFile.Count)) 
{
    Show-ErrorMessage "The package in $pkgPath should only contains one .diagpkg file"
}

$cabFileName = $diagpkgFile[0].name.split(".")[0] + ".diagcab"


$cabDirectives = ".Set CabinetNameTemplate=" + $cabFileName
$cabDirectives += "
.Set DiskDirectoryTemplate=" +$cabFilePath +"
.Set Cabinet=on
.Set Compress=on
"

$chileItems = Get-ChildItem -Path $compiledPackPath 
if( ($chileItems -eq $Null) -or ($chileItems.Count -eq 0))
{
    return
}

foreach ($item in $chileItems)
{
    if ($item.GetType().Name -ieq "FileInfo") 
    {
        $cabDirectives += "'" + $item.fullname + "'
        "
    } 
    elseif ($item.GetType().Name -ieq "DirectoryInfo") 
    {
        #
        # Only Support Subdirectories 1-level deep. This is by design
        #
        $subDirectory = $item
        $cabDirectives += ".Set DestinationDir=" + $subDirectory + "
        "
        $chileItemsSnd = get-childitem -Path $subDirectory.fullname
        foreach ($itemSnd in $chileItemsSnd)
        {
            if ($itemSnd.GetType().Name -ieq "FileInfo") 
            {
                $cabDirectives += "'" + $itemSnd.fullname + "'
                "
            }
        }
        
        $cabDirectives += ".Set DestinationDir=
        "
    }
}

$cabdirectives | out-file -encoding ascii -filepath .\cabdirectives.txt

& "makecab.exe" /F ".\cabdirectives.txt"

Remove-Item -Path .\setup.inf -Force -ErrorAction SilentlyContinue
Remove-Item -Path .\setup.rpt -Force -ErrorAction SilentlyContinue
Remove-Item -Path .\cabdirectives.txt -Force -ErrorAction SilentlyContinue

$cabFileFullName = Join-Path -Path $cabFilePath -ChildPath $cabFileName

Set-AuthenticodeSignature $cabFileFullName $codeSignCertificate -timestampserver $timestampserver
# SIG # Begin signature block
# MIIa+wYJKoZIhvcNAQcCoIIa7DCCGugCAQExCzAJBgUrDgMCGgUAMGkGCisGAQQB
# gjcCAQSgWzBZMDQGCisGAQQBgjcCAR4wJgIDAQAABBAfzDtgWUsITrck0sYpfvNR
# AgEAAgEAAgEAAgEAAgEAMCEwCQYFKw4DAhoFAAQUqPuONm0kHJDFwsx0DMYZJxmd
# 2+egghXYMIIEhTCCA22gAwIBAgIKYQX3HgAAAAAAMjANBgkqhkiG9w0BAQUFADB5
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
# KwYBBAGCNwIBFTAjBgkqhkiG9w0BCQQxFgQUdvNrXPBw220i5B8NpbUISD/AYvYw
# WgYKKwYBBAGCNwIBDDFMMEqgLIAqAE0AaQBjAHIAbwBzAG8AZgB0ACAAQwBvAHIA
# cABvAHIAYQB0AGkAbwBuoRqAGGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbTANBgkq
# hkiG9w0BAQEFAASCAQB6qkCjWr9mK9jcsSXmBdoJXgbwbSU1EnfjROZtTBAOAyO9
# RSoLPKEOfjVJ1uLImVv9N7ZhUNmzuyHGCbB6aigGyQqptet+GA05ROadhL28Hobo
# DeZnttRMqD5Jw4L8XpBukKIWcLU82YrlaeIONE0OrKr6pMgGVoxtRHX/PRJlzdMn
# cXL9Ho7Ct3kq61rmA2dIZwclJHLA4ry6QnJz2eTCHjodlqh3URgFoB3bL0oalU4J
# 4zZ9zcW4IXu+xntoVfA7MY0m5oGQKtfwTVrysAM9VM9bxEVfKzQRJFEtDxno3tB7
# SWRXSqCea0WBFFfJH4l6XhiT5C2BOKXE8cnydKu6oYICHTCCAhkGCSqGSIb3DQEJ
# BjGCAgowggIGAgEBMIGFMHcxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xITAfBgNVBAMTGE1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQQIKYQTKaQAA
# AAAACDAHBgUrDgMCGqBdMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
# hvcNAQkFMQ8XDTA5MTAyMzA1MjA0MFowIwYJKoZIhvcNAQkEMRYEFDp7d0idJvO+
# RSUqpb+/sAYYRjzYMA0GCSqGSIb3DQEBBQUABIIBADo2BbP+p2+XHBFUZ+d6Piyc
# Zxc9E+7E4/rHRvlUVZ/sxE92E+mi+rIfREHyyx32hyz8HsULqRluwwcKZDVGkK0C
# HcM7vt4b6XQNmXBTQXW5HHf2r1A4JFcMyvzlNMB3u5sXUHjYzrExI7ryAeAnwjwz
# n18xqy7i3u+7AUAdGLZygfMDbohW0wOnT2AIsB6Q7+SxYZhTV3qJtpQ51iw2YZ4s
# 8KGnV1IbV1sIfJhRYlKaqLvDoHYjpeyxf33b5O7C0+9YR/bYehmRYEhLNa+vTFOo
# C9T9HLynJ6D0yOxteL7HmFO3RSVhQqgmr+AaqkvoY1tu+i0EfwtiAXOUWNtOw74=
# SIG # End signature block
