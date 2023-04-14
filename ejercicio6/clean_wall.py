class CleanWall:
    def __init__(self, wall, graffities):
        self.wall = wall
        self.graffities = graffities
    def __sort_graffities(self):
        self.graffities = sorted(self.graffities)
    def calculate_clean_wall(self):
        clean_length = self.wall
        self.__sort_graffities()
        end = 0
        for graffity in self.graffities:
            start, finish = graffity
            if start < end:
                if finish <= end:
                    continue
                else:
                    clean_length -= finish - end
            else:
                clean_length -= finish - start
            end = max(end, finish)
        return clean_length
