#Make sure to use Servername:Datasource name on the line. Display names will not work#
$pwDatasourceName = '%FQDN%:%Datasource%'
#Make sure the user running the cmdlet has ProjectWise Access Control turned off#
#Good idea to create a ProjectWise Logical Account for this excercise and once done you can disable or delete the account#
#Change %UserName% to the PW Logical Account%#
$pwAdminUserName = '%UserName%'
#Change %Password% to the password of the PW Logical Account%#
$pwAdminUserPassword = '%Password%'
#This line passes the cleartext to a Secure String int he PW API#
$pwAdminUserSecPassword = ConvertTo-SecureString $pwAdminUserPassword -AsPlainText -Force
#Location of the output Excel file. YOu can map this to wherever you want. The folder must exist for the path#
$outputFileName = 'c:\report\%CompanyName%stats.xlsx'
#User Account name#
$customerName = "%CompanyName%,PerfTest1"

New-PWLogin -DatasourceName $pwDatasourceName -UserName $pwAdminUserName -Password $pwAdminUserSecPassword
New-PWInputOutputPerformanceReport -OutputFileName $outputFileName -FileSizeK 100 -NumberOfFiles 10 -CollectExpensiveStatistics -CustomerName $customerName 
