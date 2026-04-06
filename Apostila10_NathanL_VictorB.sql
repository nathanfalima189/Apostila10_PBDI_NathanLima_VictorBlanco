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
