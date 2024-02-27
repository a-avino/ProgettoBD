use sushi;

-- Query 1
-- Trovare le consegne del rider ABC123DEF456GHIJ effettuate a Milano o Napoli
SELECT * FROM Consegna
WHERE Rider_cf = 'ABC123DEF456GHIJ' AND (citta = 'Milano' OR citta ='Napoli');

-- Query 2
-- Trovare il nome e il numero di telefono del cliente Neri
SElECT nome, numero
From Cliente C, Telefono T
WHERE C.email = T.Cliente_email AND Cognome = 'Neri';


-- Query 3
-- Qual' è la somma totale di tutti gli ordini
SELECT SUM(costo_totale) AS totale_costi 
FROM Ordine;

-- Query 4
-- Conta il numero di portate per ogni tipo
SELECT tipo, COUNT(*) AS numero_portate
FROM Prodotto
GROUP BY tipo;

-- Query 5
--  Trova i clienti il cui costo totale degli ordini è maggiore di 60
SELECT Cliente_email, SUM(costo_totale) AS totale_costi
FROM Ordine
GROUP BY Cliente_email
HAVING SUM(costo_totale) > 60;




-- Query 6
-- Individuare il cliente che ha speso più di tutti
SELECT Cliente_email, totale_costi
FROM spesa
WHERE totale_costi = (SELECT MAX(totale_costi)
							FROM spesa);




-- Query 7
-- Trovare i rider che hanno fatto consegne sia a Roma che a Milano
SELECT Rider_cf
FROM Consegna
WHERE citta = 'Roma' AND Rider_cf IN (SELECT Rider_cf
											FROM Consegna
												WHERE citta = 'Milano');



-- Query 8
-- Elencare il nome dei prodotti presenti in tutti gli ordini
SELECT nome
FROM Prodotto P
WHERE NOT EXISTS (SELECT *
					FROM Ordine O
                     WHERE NOT EXISTS (SELECT *
										FROM Composizione C
										 WHERE Ordine_id_ordine = id_ordine AND Prodotto_id_prodotto = id_prodotto ));


