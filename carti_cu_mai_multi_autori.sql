insert into carti (isbn, titlu, editura, data_publicare, bucati, disponibilitate) values ('978-2-21-819979-0', 'Marginea apei', 'Art', to_date('23-04-2011', 'dd-mm-yyyy'),4,1);
insert into carti (isbn, titlu, editura, data_publicare, bucati, disponibilitate) values ('978-6-23-897521-1', 'Juranalul unui nimeni', 'Corint', to_date('30-10-2015', 'dd-mm-yyyy'),5,1);
insert into carti (isbn, titlu, editura, data_publicare, bucati, disponibilitate) values ('978-1-32-982142-1', 'Fantomas', 'Corint', to_date('12-01-2014', 'dd-mm-yyyy'), 6, 0);

insert into autori (id_autor, nume) values (39, 'Shi Nai’an');
insert into autori (id_autor, nume) values (40, 'Luo Guanzhong');
insert into autori (id_autor, nume) values (41, 'Weedon Grossmith');
insert into autori (id_autor, nume) values (42, 'George Grossmith');
insert into autori (id_autor, nume) values (43, 'Marcel Allain');
insert into autori (id_autor, nume) values (44, 'Pierre Souvestre');

insert into cartiautori (isbn, id_autor) values ('978-2-21-819979-0',39);
insert into cartiautori (isbn, id_autor) values ('978-2-21-819979-0',40);
insert into cartiautori (isbn, id_autor) values ('978-6-23-897521-1',41);
insert into cartiautori (isbn, id_autor) values ('978-6-23-897521-1',42);
insert into cartiautori (isbn, id_autor) values ('978-1-32-982142-1',43);
insert into cartiautori (isbn, id_autor) values ('978-1-32-982142-1',44);



