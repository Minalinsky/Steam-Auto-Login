## Description
This is a simple **Windows** script that let you switch between Steam accounts quickly and without entering Steam Guard code every time.  
> NOTE: The script was developed in order to provide practicality to users who share the same computer with multiple people (e.g family members)

## Usage
In order to use the script, simply do the following: 
- Download the `SteamLogin.bat` file from this repository
- Open the file in a text editor
- Replace `FIRST_STEAM_USERNAME` and `SECOND_STEAM_USERNAME` with your **Steam login username**
- Run the `.bat` file and select which account you want to login into

> NOTE: When running for the **first time**, you will be asked for your Steam Guard code. However the code should not be needed for the following times.

## How it Works
The `.bat` file executes the following steps:
1. Firstly, it kills the running Steam instance (i.e closes the Steam)
2. The user must type a number from the list to select a account to login
3. The script manually set in registry **"AutoLoginUser"** as the selected username and **"RememberPassword"** to **1**.
4. The script opens steam again. Steam should read the username set in **"AutoLoginUser"** and automatically login using the *Remember Password* option

### Note
The 3rd step is actually what Steam does when an user login into his account with "Remember Password" option enabled. The script simply does it automatically for every login.

By killing the Steam process without logging out and setting the username in "AutoLoginUser" variable before opening the Steam again, the script forces Steam to reuse the stored password for each account when it is open again.

For Steam, it is the same as Logging In with *"Remember Password"* checkbox ticked, closing Steam, and reopening it, but the script sets the user in registry before reopening Steam.

## Adding More Accounts
If you need to add a third account to be able to quick switch between them, open the `.bat` file in some text editor and add the following lines:
```bat
echo 3 - THIRD_STEAM_USERNAME

CHOICE /M Select /C 123

If Errorlevel 3 Goto 3

:3
set username=THIRD_STEAM_USERNAME
Goto end
```
