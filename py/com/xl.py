# -*- coding: utf-8 -*-

import openpyxl

sheetName = 'xl.xlsx'
tablesDir = 'tables\\'

try:
	wb = openpyxl.load_workbook(filename = tablesDir + sheetName)
	sheet = wb['test']

	val = sheet['A1'].value
	print(val)

	val = sheet['B1'].value
	print(val)

	sheet['A2'] = 'Hello'
	sheet['B2'] = 'from'
	sheet['C2'] = 'Python!'

	try:
		wb.save(tablesDir + sheetName)
		print('Added new sheets value, check the ' + sheetName)
	except PermissionError:
		print('[~] Permission Error! [~]')

except FileNotFoundError:
	print('[~] File not founded! [~]')