class FileReader:
    @staticmethod
    def read_cases(file_path):
        cases = {}
        current_case = None
        with open(file_path) as file:
            for line in file:
                if line.startswith('#'):
                    # grab last word in line
                    current_case = line.strip().split()[-1]
                elif line.strip():
                    cases.setdefault(current_case, []).append(line.strip())
        return list(cases.items())
