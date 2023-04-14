import sys
from clean_wall import CleanWall

if len(sys.argv) < 2:
    print("Usage: python3 main.py <input_file>")
    sys.exit(1)

def read_input_file(input_file):
    with open(input_file, "r") as f:
        cases = []
        wall = None
        graffities = []
        current_case = None
        for line in f:
            if line.startswith("#"):
                if current_case and wall and graffities:
                    cases.append((current_case, wall, graffities))
                    current_case = None
                    wall = None
                    graffities = []
                current_case = line.split()[-1]
            # else if line has only one word, it's the wall length
            elif len(line.split()) == 1:
                wall = int(line)
            else:
                graffities.append([int(x) for x in line.split()])
            # do something at the end of the file
        if current_case and wall and graffities:
            cases.append((current_case, wall, graffities))
        return cases


def main():
    cases = read_input_file(sys.argv[1])
    print(cases)
    for case, wall, graffities in cases:
        clean_wall = CleanWall(wall, graffities)
        print("Case #{}: {}".format(case, clean_wall.calculate_clean_wall()))

if __name__ == "__main__":
    main()

