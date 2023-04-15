class FileReader:
  def read_cases(file_path):
      cases = []
      current_case = None
      with open(file_path) as f:
          for line in f:
              if line.startswith('#'):
                  current_case = line.split()[-1]
              elif line.strip():
                  cases.append([current_case, line.strip()])
      return cases
