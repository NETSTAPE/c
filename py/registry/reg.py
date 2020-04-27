# -*- coding: utf-8 -*-

import winreg


keyVal = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion"
valName = 'PythonTest'
hKey = 'HKEY_CURRENT_USER\\'

try:
    key = winreg.OpenKey(winreg.HKEY_CURRENT_USER, keyVal, 0, winreg.KEY_ALL_ACCESS)
    print('Create test key...\n')
except:
    key = winreg.CreateKey(winreg.HKEY_CURRENT_USER, keyVal)

winreg.SetValueEx(key, "PythonTest", 0, winreg.REG_DWORD, 0xFFFFFFFF)

# Get Value
val = winreg.QueryValueEx(key, "PythonTest")
print(valName, ':', val[0],
	'\nType', ':', val[1],
	'\nPath', ':', hKey + keyVal + '\n')

##########

winreg.DeleteValue(key, "PythonTest")
print('Remove test key...')

winreg.CloseKey(key)