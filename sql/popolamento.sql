use sushi;


-- Popolamento tabella Cliente
INSERT INTO Cliente (email, nome, cognome) VALUES
('cliente1@email.com', 'Mario', 'Rossi'),
('cliente2@email.com', 'Luca', 'Bianchi'),
('cliente3@email.com', 'Anna', 'Verdi'),
('cliente4@email.com', 'Giulia', 'Neri'),
('cliente5@email.com', 'Paolo', 'Gialli'),
('cliente6@email.com', 'Roberta', 'Azzurri'),
('cliente7@email.com', 'Giovanni', 'Arancioni'),
('cliente8@email.com', 'Elena', 'Marroni'),
('cliente9@email.com', 'Davide', 'Rosa'),
('cliente10@email.com', 'Laura', 'Viola');

-- Popolamento tabella Telefono
INSERT INTO Telefono (Cliente_email, numero) VALUES
('cliente1@email.com', '1234567890'),
('cliente2@email.com', '9876543210'),
('cliente3@email.com', '1112233445'),
('cliente4@email.com', '5556667777'),
('cliente5@email.com', '9990001111'),
('cliente6@email.com', '4443332222'),
('cliente7@email.com', '7778889999'),
('cliente8@email.com', '3332221111'),
('cliente9@email.com', '8887776666'),
('cliente10@email.com', '2221110000');

-- Popolamento tabella Rider
INSERT INTO Rider (cf, nome, cognome, data_iscrizione) VALUES
('ABC123DEF456GHIJ', 'Marco', 'Russo', '2023-01-15'),
('DEF456GHIJ789KLM', 'Sara', 'Ferrari', '2023-02-20'),
('GHIJ789KLM012NOP', 'Luigi', 'Conti', '2023-03-25'),
('JKLM012NOP345QRS', 'Valentina', 'Perez', '2023-04-10'),
('NOP345QRS678TUV', 'Antonio', 'Martinez', '2023-05-05'),
('QRS678TUV901WXY', 'Francesca', 'Romano', '2023-06-15'),
('TUV901WXY234ZAB', 'Riccardo', 'Moretti', '2023-07-20'),
('WXY234ZAB567CDE', 'Martina', 'Galli', '2023-08-30'),
('ZAB567CDE890FGH', 'Paolo', 'Vitali', '2023-09-10'),
('CDE890FGH123IJK', 'Giorgia', 'Longo', '2023-10-05');

-- Popolamento tabella Ordine
INSERT INTO Ordine (costo_totale, Cliente_email) VALUES
(30.50, 'cliente1@email.com'),
(25.00, 'cliente2@email.com'),
(40.20, 'cliente3@email.com'),
(15.80, 'cliente4@email.com'),
(50.75, 'cliente5@email.com'),
(35.90, 'cliente6@email.com'),
(28.60, 'cliente7@email.com'),
(42.30, 'cliente8@email.com'),
(19.45, 'cliente9@email.com'),
(33.15, 'cliente10@email.com'),
(30.50, 'cliente1@email.com'),
(25.00, 'cliente2@email.com'),
(40.20, 'cliente3@email.com'),
(15.80, 'cliente4@email.com'),
(50.75, 'cliente5@email.com'),
(35.90, 'cliente6@email.com'),
(28.60, 'cliente7@email.com'),
(42.30, 'cliente8@email.com'),
(19.45, 'cliente9@email.com'),
(33.15, 'cliente10@email.com');

-- Popolamento tabella Consegna
INSERT INTO Consegna (Ordine_id_ordine, via, citta, civico, Rider_cf) VALUES
(1,'Via Roma', 'Milano', '12', 'ABC123DEF456GHIJ'),
(2,'Via Verdi', 'Roma', '45', 'ABC123DEF456GHIJ'),
(3,'Via Dante', 'Napoli', '78', 'GHIJ789KLM012NOP'),
(4,'Via Garibaldi', 'Firenze', '23', 'JKLM012NOP345QRS'),
(5,'Corso Vittorio Emanuele', 'Torino', '56', 'NOP345QRS678TUV'),
(6,'Via Carducci', 'Bologna', '89', 'QRS678TUV901WXY'),
(7,'Via Leopardi', 'Genova', '34', 'TUV901WXY234ZAB'),
(8,'Corso Italia', 'Palermo', '67', 'WXY234ZAB567CDE'),
(9,'Via Mazzini', 'Catania', '90', 'ZAB567CDE890FGH'),
(10,'Via Manzoni', 'Bari', '12', 'CDE890FGH123IJK');

-- Popolamento tabella Ritiro
INSERT INTO Ritiro (Ordine_id_ordine, orario_ritiro) VALUES
(11,'10:00:00'),
(12,'11:30:00'),
(13,'14:15:00'),
(14,'16:45:00'),
(15, '18:20:00'),
(16, '20:00:00'),
(17, '09:30:00'),
(18, '13:00:00'),
(19, '15:45:00'),
(20, '17:30:00');

-- Popolamento tabella Prodotto
INSERT INTO Prodotto (tipo, costo, nome) VALUES
('Sashimi', 12.50, 'Sashimi di Salmone'),
('Ramen', 8.00, 'Ramen al Tonno'),
('Nigiri', 15.80, 'Nigiri Salmone'),
('Sashimi', 10.25, 'Sashimi di Tonno'),
('Nigiri', 18.40, 'Nigiri Uovo'),
('Antipasto', 14.70, 'Gyoza'),
('Sashimi', 20.60, 'Sashimi Tonno'),
('Nigiri', 9.90, 'Nigiri Gamberi'),
('Ramen', 22.30, 'Ramen al Maiale'),
('Antipasto', 16.50, 'Involtino Primavera');

-- Popolamento tabella Composizione
INSERT INTO Composizione (Ordine_id_ordine, Prodotto_id_prodotto, quantita) VALUES
(1, 1, 2),
(1, 3, 1),
(2, 1, 1),
(2, 8, 3),
(3, 1, 1),
(3, 4, 2),
(4, 1, 1),
(4, 9, 1),
(5, 1, 3),
(5, 10, 2),
(6, 1, 5),
(6, 7, 2),
(7, 1, 3),
(7, 6, 1),
(8, 1, 2),
(8, 2, 1),
(9, 1, 4),
(9, 8, 5),
(10, 1, 2),
(10, 3, 1),
(11, 1, 4),
(11, 7, 2),
(12, 1, 2),
(12, 4, 5),
(13, 1, 1),
(13, 5, 2),
(14, 1, 3),
(14, 5, 9),
(15, 1, 2),
(15, 2, 3),
(16, 1, 4),
(16, 5, 2),
(17, 1, 5),
(17, 8, 7),
(18, 1, 3),
(18, 4, 5),
(19, 1, 5),
(19, 3, 4),
(20, 1, 6),
(20, 7, 1);



