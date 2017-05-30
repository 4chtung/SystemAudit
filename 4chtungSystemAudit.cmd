@echo off

ECHO "========================"
ECHO "=----SYSTEM AUDITOR----="
ECHO "=-------4CHTUNG--------="
ECHO "=-RUNNING SYSTEM AUDIT-="
ECHO "========================"

ECHO "CHECKING SERVICE PATHS"

ECHO "--------------------------------" > %computername%SystemAudit.txt
ECHO "PCU AUDIT START - %COMPUTERNAME%" >> %computername%SystemAudit.txt
ver >> %computername%SystemAudit.txt
ECHO "--------------------------------" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

systeminfo >> %computername%SystemAudit.txt

ECHO. >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

ECHO "TCP/IP Info" >> %computername%SystemAudit.txt
ECHO "--------------------------" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
ipconfig /all >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

ECHO "Stored DNS Info" >> %computername%SystemAudit.txt
ECHO "--------------------------" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
ipconfig /displaydns >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

ECHO "Network Routing" >> %computername%SystemAudit.txt
ECHO "--------------------------" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
route print >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

ECHO "Active Connections" >> %computername%SystemAudit.txt
ECHO "--------------------------" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
netstat -an >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

ECHO "SYSTEM Applications" >> %computername%SystemAudit.txt
ECHO "--------------------------" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
tasklist /fi "username ne NT AUTHORITY\SYSTEM" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

ECHO "Export Group Policy" >> %computername%SystemAudit.txt
ECHO "--------------------------" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
gpresult /f /H %computername%grppolicy.html >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

ECHO "Dumping Firewall Rules" >> %computername%SystemAudit.txt
ECHO "--------------------------" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
netsh advfirewall show allprofiles >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

ECHO "Current Logged In User" >> %computername%SystemAudit.txt
ECHO "--------------------------" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
whoami /all >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

ECHO "Local Admin Enum" >> %computername%SystemAudit.txt
ECHO "--------------------------" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
net localgroup administrators >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

ECHO "List Shares" >> %computername%SystemAudit.txt
ECHO "--------------------------" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
net share /y >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

ECHO "Unrestricted Service Paths" >> %computername%SystemAudit.txt
ECHO "--------------------------" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
::Old command only finds Auto services, we want to expand this slightly
::wmic service get name,displayname,pathname,startmode |findstr /i "auto" |findstr /i /v "c:\windows\\" |findstr /i /v """ >> %%computername%%SystemAudit.txt

ECHO "AUTO Launch" >> %computername%SystemAudit.txt
wmic service get name,displayname,pathname,startmode  |findstr /i "auto" |findstr /i /v "c:\windows\\" |findstr /i /v """" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

ECHO "Manual Launch" >> %computername%SystemAudit.txt
wmic service get name,displayname,pathname,startmode  |findstr /i "manual" |findstr /i /v "c:\windows\\" |findstr /i /v """" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

ECHO "Disabled Services" >> %computername%SystemAudit.txt
wmic service get name,displayname,pathname,startmode  |findstr /i "disabled" |findstr /i /v "c:\windows\\" |findstr /i /v """" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

ECHO "Patches" >> %computername%SystemAudit.txt
ECHO "--------------------------" >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
wmic qfe >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt
ECHO. >> %computername%SystemAudit.txt

PAUSE
