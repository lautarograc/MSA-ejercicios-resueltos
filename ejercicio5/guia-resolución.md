### Sin dudas me resultó el ejercicio mas desafiante de la serie, al menos a nivel de pensar lógicamente.

### A priori no parecía muy raro. Inicialicé un array de tamaño 0 poblado con 0s para ir permutando con valores de 1s, incrementando un contador cada vez que encontraba una serie de al menos 3 1s.


## ese código era algo así:
`

def permute_array(n):
    result = []
    def backtrack(arr, i):
        if i == n:
            result.append(arr.copy())
            return
        for j in [0, 1]:
            arr[i] = j
            backtrack(arr, i+1)
    backtrack([0]*n, 0)
    return result


count = 0
for p in permute_array(4):
    s = ''.join(str(e) for e in p)
    if "000" in s:
        count += 1
print(count)

`
## El código, si bien funcionaba con los inputs de prueba (n=4, n=5), era terriblemente exponencial para el CPU (complejidad O(2^n)). Alrededor de n = 25 ya crasheaba.

## Intenté optimizarlo de varias formas, en un momento incluso pensé que era buena idea implementar multiprocessing para distribuir el trabajo en varios núcleos, estuvo OK pero realmente no era buena idea y también terminaba crasheando (con n=30 ya me spikeaba todos los núcleos del i9)

### Investigué un poco más sobre combinatoria y encontré un caso muy similar a este que usaba la secuencia tribonacci, o la suma de los 3 números anteriores.
### Para implementarla, "invertí" mi lógica de contar los casos con series de 1s y empecé a contar los casos que no tenían series de 1s (para aplicar la iteración bottom-up del tribo) para después sustraerlo de la cantidad de casos totales (2^n).
