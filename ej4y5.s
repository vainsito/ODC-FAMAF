 CMP X0,X9
 B.EQ panchito
 CMP X1,X9
 B.eq panchito
 ADDI  X0, X0,#1
 ADDI X1, X1, #1
panchito: ADDI X2, X2, #1
end:

EQ: Igual (Equal)
NE: No igual (Not Equal)
LT: Menor que (Less Than)
LE: Menor o igual que (Less Than or Equal)
GT: Mayor que (Greater Than)
GE: Mayor o igual que (Greater Than or Equal)
// 4)
 loop : ADDI X0,X0,#2
          SUBI X1, X1, #1
          CBNZ X1, loop
    done :

// 4.B) 
loop :   SUBIS X1,X1,#0
            B.LE done
            SUBI X1, X1, #1
            ADDI X0,X0,#2
            B loop
    done :

// x0 = 0 , x1 = 10

long acc, i ;
while(i != 0){
    acc += i;
    i--;
}

long acc, i ;
while(i > 0){
    acc = acc + 2;
    i--;
}

// 5.2) 

long i, a, result, 
char *MemArray
i = 0;
while(i < 100){
    a = MemArray[0];
    result = result + a;
    MemArray = MemArray + 8;
    i++;
}