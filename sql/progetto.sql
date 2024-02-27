drop database if exists sushi;
create database sushi;
use sushi;

create table Cliente (
email varchar(30) not null,
nome varchar(15) not null,
cognome varchar(15) not null,
Primary key (email) 
);

create table Telefono (
Cliente_email varchar(30) not null,
numero char(10) not null,
Primary key (numero),
Foreign key (Cliente_email) references Cliente(email)
	on delete cascade
);

create table Rider (
cf char(16) not null,
nome varchar(15) not null,
cognome varchar(15) not null,
data_iscrizione date not null,
Primary key (cf)
);

create table Ordine (
id_ordine int auto_increment not null,
costo_totale float not null,
Cliente_email varchar(30) not null,
Primary key (id_ordine),
Foreign key (Cliente_email) references Cliente(email)
	on delete cascade
);

create table Consegna (
Ordine_id_ordine int not null,
via varchar(50) not null,
citta varchar(15) not null,
civico varchar(5) not null,
Rider_cf char(16) not null,
Primary key (Ordine_id_ordine),
Foreign key (Rider_cf) references Rider(cf)
	on delete cascade,
Foreign key (Ordine_id_ordine) references Ordine(id_ordine)
	on delete cascade
);

create table Ritiro (
Ordine_id_ordine int not null,
orario_ritiro time not null,
Primary key (Ordine_id_ordine),
Foreign key (Ordine_id_ordine) references Ordine(id_ordine)
on delete cascade
);

create table Prodotto (
id_prodotto int auto_increment not null,
tipo varchar(40) not null,
costo float not null,
nome varchar(20) not null,
Primary key (id_prodotto)
);


create table Composizione (
Ordine_id_ordine int  not null,
Prodotto_id_prodotto int  not null,
quantita int not null,
Primary key (Ordine_id_ordine, Prodotto_id_prodotto),
Foreign key (Ordine_id_ordine) references Ordine(id_ordine)
 on delete cascade,
Foreign key (Prodotto_id_prodotto) references Prodotto(id_prodotto)
	on delete cascade
);

























