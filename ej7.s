/* Traducir el siguiente programa C a LEGv8. La asignacion de variables a registros X0, X1, X2, X3, X9. 
    DONDE X0 = A, X1= s, X2 = i, X3 = j, X9 = N. Notar que en C los arreglos bidimensionales se representan 
    en memoria usando un orden por filas, es decir &A[i][j] = A + 8*(i*N + j) 
    
    #define N (1<<10)
    long A[N][N], s, i, j;
    s = 0;
    for (i = 0; i < N; i++)
        for (j = 0; j < N; j++)
            s += A[i][j];
    */

    // Codigo en LEGv8

    ADDI X9, XZR, #1024 // X9 = N
    ADDI X2, XZR, #0 // X2 = i
    ADDI X1, XZR, #0 // X1 = s
    ADDI X3, XZR, #0 // X3 = j
    loop: // for (i = 0; i < N; i++)
        CMP X2, X9
        B.GE end
        ADD X3, X3 ,#0 // j = 0
        loop2: // for (j = 0; j < N; j++)
            CMP X3, X9
            B.GE iend
            mul X10, X2, X9 // X10 = i*N
            ADD X10, X10, X3 // X10 = i*N + j
            LSL X10, X10, #3 // X10 = 8*(i*N + j)
            ADD X10, X10, X0 // X10 = A + 8*(i*N + j)
            LDUR X11, [X10, #0] // X11 = A[i][j]
            ADD X1, X1, X11 // s += A[i][j]
            ADDI X3, X3, #1 // j++
            B.LT loop2 // end for (j = 0; j < N; j++)
    iend:   ADDI X2, X2, #1 // i++
            B.LT loop // end for (i = 0; i < N; i++)
    end: