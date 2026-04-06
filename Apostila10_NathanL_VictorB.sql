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

