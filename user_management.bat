@echo off
title Script by rodmutt on yt
color 2
echo User Management
echo note : Make sure to run this as administrator to avoid errors.

:menu
echo Choose an option:
echo 1. Create User
echo 2. Delete User
echo 3. Reset Password
echo 4. Change User Group
echo 5. Exit

set /p choice=Enter your choice: 

if "%choice%"=="1" goto createUser
if "%choice%"=="2" goto deleteUser
if "%choice%"=="3" goto resetPassword
if "%choice%"=="4" goto changeUserGroup
if "%choice%"=="5" goto end

:createUser
echo Creating new user...
set /p username=Enter username: 
net user %username% /add
echo User %username% created successfully.
goto menu

:deleteUser
echo Deleting user...
set /p username=Enter username to delete: 
net user %username% /delete
echo User %username% deleted successfully.
goto menu

:resetPassword
echo Resetting user password...
set /p username=Enter username to reset password: 
net user %username% *
echo Password for user %username% reset successfully.
goto menu

:changeUserGroup
echo Changing user group...
set /p username=Enter username: 
set /p group=Enter new group (e.g., Administrators, Users): 
net localgroup %group% %username% /add
echo User %username% added to group %group% successfully.
goto menu

:end
echo Exiting User Management script.
