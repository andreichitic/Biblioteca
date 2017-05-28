

Create table Carti(
ISBN varchar2(20) not null,
Titlu varchar2(50) not null,
Editura varchar2(50),
Data_publicare date,
Bucati number(6),
Disponibilitate number(1),
constraint pk_isbn primary key (isbn)
)
/

Create table Autori(
id_autor number(6) not null,
Nume varchar2(50),
constraint pk_id_autor primary key (id_autor)
)
/

Create table NrBucati(
id number(6),
ISBN varchar2(20) not null,
nr_bucata number(6),
constraint nrbucati_pk primary key (isbn, nr_bucata),
constraint fk_isbn2 foreign key (isbn) references carti(isbn)  
)
/

Create table Imprumuturi(
id_imprumut number(6) not null,
ISBN varchar2(20) not null,
nr_bucata number(6) not null,
CNP varchar2(13) not null,
Data_imprumut date,
Data_returnare date,
constraint pk_id_imprumut primary key (id_imprumut),
constraint fk_nr_bucata foreign key(ISBN, nr_bucata) references NrBucati(ISBN ,nr_bucata),
constraint fk_cnp foreign key (CNP) references Clienti(CNP)

)
/
Create table Clienti(
id_client number(6),
CNP varchar2(13) not null,
Nume varchar2(50) not null,
Adresa varchar2(50),
Email varchar2(50),
constraint pk_cnp primary key (cnp)
)
/
Create table CartiAutori (
ISBN varchar2(20),
id_autor number(6),
constraint fk_isbn foreign key (isbn) references carti(isbn),
constraint fk_id_autor foreign key(id_autor) references autori(id_autor)
)
