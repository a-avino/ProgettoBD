CREATE VIEW spesa AS
SELECT Cliente_email, SUM(costo_totale) AS totale_costi
FROM Ordine
GROUP BY Cliente_email;