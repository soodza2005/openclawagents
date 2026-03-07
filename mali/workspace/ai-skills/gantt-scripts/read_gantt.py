import openpyxl
wb = openpyxl.load_workbook('D:/Download/Gantt chart.xlsx')
ws = wb['Gantt Chart']

output = []
for i, row in enumerate(ws.iter_rows(min_row=1, max_row=20, min_col=1, max_col=15)):
    values = []
    for cell in row:
        if cell.value:
            v = str(cell.value)[:15]
            values.append(v.replace('\n', ' '))
        else:
            values.append('')
    output.append(f"Row {i+1}: {values}")

print('\n'.join(output))
