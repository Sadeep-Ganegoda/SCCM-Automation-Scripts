@echo off
echo Running SCCM Client Actions...

:: Trigger Application Deployment Evaluation Cycle
wmic /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000121}"

:: Trigger Discovery Data Collection Cycle
wmic /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000113}"

:: Trigger File Collection Cycle
wmic /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000111}"

:: Trigger Hardware Inventory Cycle
wmic /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000101}"

:: Trigger Machine Policy Retrieval & Evaluation Cycle
wmic /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000021}"

:: Trigger Software Inventory Cycle
wmic /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000102}"

:: Trigger Software Metering Usage Report Cycle
wmic /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000031}"

:: Trigger Software Updates Deployment Evaluation Cycle
wmic /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000108}"

:: Trigger Software Updates Scan Cycle
wmic /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000111}"

:: Trigger User Policy Retrieval & Evaluation Cycle
wmic /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000024}"

:: Trigger Windows Installer Source List Update Cycle
wmic /namespace:\\root\ccm path sms_client CALL TriggerSchedule "{00000000-0000-0000-0000-000000000103}"

echo Completed all SCCM Client Actions.

:: Group Policy Update (FORCE)
ECHO Group Policy Updating (FORCE)
gpupdate /force

:: Restart PC
echo PC Restarting Less Than 1 minute
shutdown -r -t 30
pause
