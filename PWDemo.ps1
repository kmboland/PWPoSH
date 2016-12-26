# Demo practice script to test ProjectWise and PowerShell. 
# Author: Kevin Boland
# Version 1 
#-------------------------------------#
#           Configuration             #
#-------------------------------------#    
    # Change these values to suit your datasource
    $datasource = 'FQDN:Datasource';
    $username = 'putPWAdminhere';
    $password = 'putpassword here';
#-------------------------------------#
#          END Configuration          #
#-------------------------------------#
 
    # Stop this script if there are any errors
    $ErrorActionPreference = 'Stop'
 
    # Write out all debug and verbose messages
    $DebugPreference = 'Continue'
    $VerbosePreference = 'Continue'
 
    # Check if the PWPS module is loaded and load it if necessary
    $pwpsModule = Get-Module pwps
    if (!$pwpsModule)
        {
        Import-Module pwps
        }
    
    # Open an Admin Connection								
    Open-PWConnection -Admin -DatasourceName $datasource -UserName $username -Password $password
 
    # Output a list of connected Users  
    #This is the sample, one liners. Uncomment each line below and run it in PowerShell ISE to see results. 
    
    #Get-PWDatasource  
    #Get-pwuser
    #Get-PWUser -EMail "*J*@ben?ley.com"
    #Get-pwuser | Select-Object -Property name, SecProvider, LastLogin
    #Get-pwuser | Select-Object -Property name, SecProvider, LastLogin | export-csv c:\temp\pwdemo\hadrusers.csv
    #Get-pwuser | Select-Object -Property name, SecProvider, LastLogin | where { $_.LastLogin -gt (Get-Date).AddDays(-90) } | export-csv c:\temp\pwdemo\hadrusers90day.csv
    #New-PWUser -UserName Kevin.Boland -Password P@ssword -Description "Logical Account" -Email "Kevin.Boland@Bentley.com"
    #Remove-PWUser -UserName kevin.boland
    #Get-Help about_PWPS_UserSettings
    #Get-PWStorage
    #New-PWStorage -Name "PointCloudData1" -Host "test-pw.projectwiseonline.com" -Path "C:\temp\PointClouds1" -Description "This is strictly for PointCloud data1"
    #Get-PWAsyncExtractionSchedule -FilePropertyExtraction
    #GET-PWAsyncExtractionSchedule -FullTextIndexing
    #Set-PWAsyncExtractionSetting -ThumbnailExtraction -On
    #Get-PWAsyncExtractionSetting -FullTextIndexing -On -Live

  # Log Out of ProjectWise
	Close-PWConnection
	
    # Wait for user input to pause in case this script was not run interactively 
    Write-Host "`nPress any key to continue"
    Read-Host
