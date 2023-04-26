import sys
from consecutive_courtains import ConsecutiveCourtains

if len(sys.argv) < 2:
    print("Usage: python filename.py <file_path>")
    sys.exit()

file_path = sys.argv[1]
counter = ConsecutiveCourtains()

with open(file_path, 'r') as f:
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
