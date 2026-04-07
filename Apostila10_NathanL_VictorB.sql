-- 1.1 Resolva cada exercício a seguir usando LOOP, WHILE, FOR e FOREACH. Quando o enunciado disser que é preciso “ler” algum valor, gere-o aleatoriamente.


-- 1.1.1 Escreva um programa que imprima todos os números pares entre 1 e 100, incluindo-os se for o caso.

-- Resposta em LOOP
DO $$
DECLARE
	contador INT := 1; 
BEGIN 
	LOOP 
		IF contador > 100 THEN 
			 EXIT; 
		END IF; 
		
		IF contador % 2 = 0 THEN 
			RAISE NOTICE '%', contador;
		END IF;  
		
		contador := contador + 1; 
	END LOOP;
END;
$$;

-- Resposta em WHILE
DO $$ 
DECLARE 
    contador INT := 2;
BEGIN
    WHILE contador <= 100 LOOP
        RAISE NOTICE '%', contador;
        contador := contador + 2;
    END LOOP;
END;
$$;

-- Resposta em FOR
DO $$ 
BEGIN 
	FOR contador IN 2..100 BY 2 
	LOOP 
		RAISE NOTICE '%', contador; 
	END LOOP; 
END; 
$$;

-- Resposta em FOREACH
DO $$ 
DECLARE 
    contador INT[];  
    item INT;   
BEGIN
    contador := ARRAY(SELECT generate_series(2, 100, 2));

    FOREACH item IN ARRAY contador LOOP
        RAISE NOTICE '%', item;
    END LOOP;
END;
$$;

-- 1.1.2 Escreva um programa que leia 6 números. Esses números serão apenas positivos ou negativos (desconsidere valores nulos). Imprima o total de números positivos.

-- Resposta em LOOP
DO $$ 
DECLARE 
    contador INT := 0;
    i INT := 1;
    num INT;
BEGIN
    LOOP
        EXIT WHEN i > 6;
        num := valor_aleatorio_entre(-50,50);
		RAISE NOTICE '%, ', num;
        IF num > 0 THEN
            contador := contador + 1;
        END IF;

        i := i + 1; 
    END LOOP;

    RAISE NOTICE 'Total de números positivos: %', contador;
END $$;

-- Resposta em WHILE
DO $$ 
DECLARE 
    contador INT := 0;
    i INT := 1;
    num INT;
BEGIN
    WHILE i <= 6 LOOP
        num := valor_aleatorio_entre(-50,50);
		RAISE NOTICE '%, ', num;
        IF num > 0 THEN
            contador := contador + 1;
        END IF;
        i := i + 1;
    END LOOP;

    RAISE NOTICE 'Total de números positivos: %', contador;
END $$;

-- Resposta em FOR
DO $$ 
DECLARE 
    contador INT := 0;
    num INT;
BEGIN
    FOR i IN 1..6 LOOP
        num := valor_aleatorio_entre(-50,50);
        RAISE NOTICE '%, ', num;
        IF num > 0 THEN
            contador := contador + 1;
        END IF;
    END LOOP;

    RAISE NOTICE 'Total de números positivos: %', contador;
END $$;

-- Resposta em FOREACH
DO $$ 
DECLARE 
    numeros INT[]; 
    contador INT := 0;
    num INT;
BEGIN
    numeros := ARRAY(
        SELECT valor_aleatorio_entre(-50,50) FROM generate_series(1,6)
    );

    FOREACH num IN ARRAY numeros LOOP
    	RAISE NOTICE '%, ', num;
        IF num > 0 THEN
            contador := contador + 1;
        END IF;
    END LOOP;

    RAISE NOTICE 'Total de números positivos: %', contador;
END $$;

-- 1.1.3 Leia dois valores inteiros X e Y. Imprima a soma de todos os valores ímpares entre eles.

-- Resposta em LOOP
DO $$ 
DECLARE 
    x INT := valor_aleatorio_entre(20,50);
    y INT := valor_aleatorio_entre(20,50);
    temp INT;
    soma INT := 0;
BEGIN
    IF x > y THEN
        temp := x;
        x := y;
        y := temp;
    END IF;

    x := x + 1; 
	RAISE NOTICE 'X e Y: %, %', x,y;
    LOOP
        EXIT WHEN x >= y; 

        IF x % 2 <> 0 THEN
            soma := soma + x;
        END IF;

        x := x + 1; 
    END LOOP;

    RAISE NOTICE 'Soma dos ímpares entre X e Y: %', soma;
END $$;

-- Resposta em WHILE
DO $$ 
DECLARE 
	x INT := valor_aleatorio_entre(20,50);
    y INT := valor_aleatorio_entre(20,50);
    temp INT;
    soma INT := 0;
BEGIN
    IF x > y THEN
        temp := x;
        x := y;
        y := temp;
    END IF;

    x := x + 1; 
	RAISE NOTICE 'X e Y: %, %', x,y;
    WHILE x < y LOOP
        IF x % 2 <> 0 THEN
            soma := soma + x;
        END IF;
        x := x + 1;
    END LOOP;

    RAISE NOTICE 'Soma dos ímpares entre X e Y: %', soma;
END $$;

-- Resposta em FOR
DO $$
DECLARE
	x INT := valor_aleatorio_entre(20,50);
    y INT := valor_aleatorio_entre(20,50);
    temp INT;
    soma INT := 0;
BEGIN
    IF x > y THEN
        temp := x;
        x := y;
        y := temp;
    END IF;

    FOR i IN (x + 1)..(y - 1) LOOP
        IF i % 2 <> 0 THEN
            soma := soma + i;
        END IF;
    END LOOP;
    
    RAISE NOTICE 'Soma dos ímpares: %', soma;
END $$;

-- Resposta em FOREACH
DO $$ 
DECLARE 
  numeros INT[]; 
  contador INT := 0;
  num INT;
BEGIN
    numeros := ARRAY(
        SELECT valor_aleatorio_entre(20,50) FROM generate_series(1,6)
    );

    FOREACH num IN ARRAY numeros LOOP
    	RAISE NOTICE '%, ', num;
        IF num > 0 THEN
            contador := contador + 1;
        END IF;
    END LOOP;

    RAISE NOTICE 'Total de números positivos: %', contador;
END $$;

-- 1.1.4 Leia um conjunto não determinado de pares de valores M e N. Para cada par lido, mostre a sequência do menor até o maior e a soma dos inteiros consecutivos entre eles.

-- Resposta em LOOP
DO $$ 
DECLARE 
  m INT := valor_aleatorio_entre(1,100);
  n INT := valor_aleatorio_entre(1,100);
  temp INT;
  soma INT := 0;
	resultado TEXT;
BEGIN
    IF m > n THEN
        temp := m;
        m := n;
        n := temp;
    END IF;
  
    resultado := '';
    
    LOOP
        EXIT WHEN m > n;
        resultado := resultado || m || ' ';
        soma := soma + m;
        m := m + 1;
    END LOOP;
    resultado := resultado || 'Soma=' || soma;
    RAISE NOTICE 'LOOP: %', resultado;

	END $$; 

-- Resposta em WHILE

DO $$ 
DECLARE 
  m INT := valor_aleatorio_entre(1,100);
  n INT := valor_aleatorio_entre(1,100);
  temp INT;
  soma INT := 0;
	resultado TEXT;
BEGIN
	IF m > n THEN
        temp := m;
        m := n;
        n := temp;
    END IF;
  
   
    resultado := '';
    
	WHILE m <= n LOOP
        resultado := resultado || m || ' ';
        soma := soma + m;
        m := m + 1;
    END LOOP;
    resultado := resultado || 'Soma=' || soma;
    RAISE NOTICE 'WHILE: %', resultado;

END $$;

-- Resposta em FOR

DO $$ 
DECLARE 
  m INT := valor_aleatorio_entre(1,100);
  n INT := valor_aleatorio_entre(1,100);
  temp INT;
  soma INT := 0;
	resultado TEXT;
BEGIN
	IF m > n THEN
        temp := m;
        m := n;
        n := temp;
    END IF;
   
    resultado := '';
    
	FOR i IN m..n LOOP
        resultado := resultado || i || ' ';
        soma := soma + i;
    END LOOP;
    resultado := resultado || 'Soma=' || soma;
    RAISE NOTICE 'FOR: %', resultado;

END $$;

-- Resposta em FOREACH

DO $$ 
DECLARE 
  m INT := valor_aleatorio_entre(1,100);
  n INT := valor_aleatorio_entre(1,100);
  temp INT;
  soma INT := 0;
	resultado TEXT;
	numeros INT[]; 
	num INT;
BEGIN
    numeros := ARRAY(
        SELECT generate_series(m, n)
    );
 	resultado := '';
    
	FOREACH num IN ARRAY numeros LOOP
			resultado := resultado || num || ' ';
            soma := soma + num;
	END LOOP;
	resultado := resultado || 'Soma=' || soma;
	RAISE NOTICE 'FOREACH: %', resultado;
END $$;

-- 1.2 Faça um programa que calcule o determinante de uma matriz quadrada de ordem 3 utilizando a regra de Sarrus.
DO $$
DECLARE
    matriz INT[3][3];
    determinante INT;
BEGIN
    -- Definição da matriz 3x3 com valores aleatórios entre 1 e 10
    matriz := ARRAY[
        [valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12)],
        [valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12)],
        [valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12), valor_aleatorio_entre(1,12)]
    ];
    
    -- Cálculo do determinante pela Regra de Sarrus
    determinante := (
        (matriz[1][1] * matriz[2][2] * matriz[3][3]) + 
        (matriz[1][2] * matriz[2][3] * matriz[3][1]) + 
        (matriz[1][3] * matriz[2][1] * matriz[3][2]) - 
        (matriz[1][3] * matriz[2][2] * matriz[3][1]) - 
        (matriz[1][1] * matriz[2][3] * matriz[3][2]) - 
        (matriz[1][2] * matriz[2][1] * matriz[3][3])
    );
    
    RAISE NOTICE 'Matriz: %', matriz;
    RAISE NOTICE 'Determinante: %', determinante;
END $$;

