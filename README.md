### Si tenés algun cambio para hacer proponelo como MR o creá un issue
### Los dos primeros ejercicios están realizados en Ruby
### Faltan tests debido a que suelo dejarlo para lo último (la repo aplica DDD) pero lamentablemente @recruitingmsa.reviews@gmail.com me ghosteó después de hacerme perder 2 semanas.


## Solución ejercicio entrada:

¿Podrías decirnos cuál es el resultado de ejecutar el siguiente pseudocódigo? (suponiendo que la máquina tiene los recursos suficientes para terminar de ejecutarlo). Por favor no olvides comentarnos cuál fue tu razonamiento para llegar al resultado.
```
function puzzle(N) {
.A = 1
.B = 1
.C = 1
.D = 1
.repeat N times {
....X = D + 2 * C + 3 * B + 4 * A
....A = B
....B = C
....C = D
....D = X
.}
return D % 10000000000 // últimos 10 dígitos de D
}

print puzzle(10)
print puzzle(100)
print puzzle(pow(2022, 100)) // 2022 elevado a la 100


====== Output ======
30520
720820623
???
```


SOLUCIÓN (python):

```
def matrix_pow(matrix, power, modulus):
    # Inicializa el resultado con la matriz identidad del mismo tamaño que la matriz original
    result = [[int(i == j) for j in range(len(matrix))] for i in range(len(matrix))]
    while power > 0:
        # Si el bit actual de la potencia es 1, multiplica el resultado por la matriz
        if power % 2 == 1:
            result = matrix_multiply(result, matrix, modulus)
        # Eleva la matriz al cuadrado y divide la potencia por 2
        matrix = matrix_multiply(matrix, matrix, modulus)
        power //= 2
    # Retorna el resultado
    return result

def matrix_multiply(matrix1, matrix2, modulus):
    # Inicializa el resultado con una matriz del tamaño apropiado llena de ceros
    result = [[0] * len(matrix2[0]) for _ in range(len(matrix1))]
    # Realiza la multiplicación de matrices
    for i in range(len(matrix1)):
        for j in range(len(matrix2[0])):
            for k in range(len(matrix2)):
                result[i][j] += matrix1[i][k] * matrix2[k][j]
                result[i][j] %= modulus
    # Retorna el resultado
    return result

def puzzle(n):
    # Inicializa la matriz M
    M = [[0, 1, 0, 0],
         [0, 0, 1, 0],
         [0, 0, 0, 1],
         [4, 3, 2, 1]]
    # Calcula M^n reducido módulo 10^10
    M_pow = matrix_pow(M, n, 10**10)
    # Inicializa el vector v
    v = [1, 1, 1, 1]
    # Multiplica M^n por v para obtener la solución
    result = matrix_multiply(M_pow, [[x] for x in v], 10**10)
    # Retorna el elemento en la cuarta fila y primera columna del resultado
    return result[3][0]

print(puzzle(10))
# output 30520
print(puzzle(100))
# outputs 720820623
print(puzzle(2022**100))
# outputs 2436815984

```

