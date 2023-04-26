class ConsecutiveCourtains:
    def __init__(self):
        pass
    def count_row_courtains(self, n):
        return 2**n - self.__count_not_row_courtains(n)
    def __count_not_row_courtains(self, n):
        a, b, c = 1, 2, 4
        for i in range(n - 2):
            a, b, c = b, c, a+b+c
        return c
