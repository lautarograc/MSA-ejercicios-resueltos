from consecutive_courtains import ConsecutiveCourtains

counter = ConsecutiveCourtains()

with open('ejercicio5/test.txt', 'r') as f:
    lines = f.readlines()

output = ''

for line in lines:
    line = line.strip()
    if line.startswith('# case'):
        output += line.split(' ')[-1]
    else:
        result = counter.count_row_courtains(int(line))
        output += f'. {result}\n' # Add the result to the output

print(output)
