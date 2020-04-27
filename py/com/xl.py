import openpyxl

sheetName = u'xl.xlsx'
tablesDir = u'tables\\'

try:
	wb = openpyxl.load_workbook(filename = tablesDir + sheetName)
	sheet = wb['test']

	val = sheet['A1'].value
	print(val)

	val = sheet['B1'].value
	print(val)

	sheet['A2'] = u'Hello'
	sheet['B2'] = u'from'
	sheet['C2'] = u'Python!'

	try:
		wb.save(tablesDir + sheetName)
		print(u'Added new sheets value, check the ' + sheetName)
	except PermissionError:
		print(u'[~] Permission Error! [~]')

except FileNotFoundError:
	print(u'[~] File not founded! [~]')