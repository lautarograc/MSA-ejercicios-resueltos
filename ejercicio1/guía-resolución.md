# Pathfinding
La solución que implementé se basa en un depth-first search, que recorre el grafo de forma iterativa. Para cada nodo, se busca el camino más corto a todos los nodos adyacentes. El algoritmo termina cuando se llega al nodo destino. La complejidad de este algoritmo es O(n+e), ya que se recorre el graph n veces y se recorren todos los nodos adyacentes a cada nodo e veces.

Elegí adaptar un DFS por que encontré que junto a los algoritmos BFS son los que se suelen elegir para resolver casos de pathfinding de nodos/edges. Preferí DFS por que me pareció mas simple de implementar.

