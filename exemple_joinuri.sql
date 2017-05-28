 --nr de imprumuturi facute de un client cu respectivul cnp
 select count(*) from imprumuturi where cnp='1600312601252';
 
 --nr de imprumuturi facute de fiecare client
 select count(*), cl.nume from imprumuturi i join clienti cl on i.cnp=cl.cnp group by cl.nume, cl.cnp;
 
 
 --clientul care a facut cele mai multe imprumuturi
 select cl.nume from clienti cl join imprumuturi i on cl.cnp=i.cnp group by cl.nume,cl.cnp having count(*)=(
 select max(count(*)) from imprumuturi i join clienti cl on i.cnp=cl.cnp group by cl.nume, cl.cnp);
 
 
 --de cate ori a fost imprumutata fiecare carte
 select c.titlu, count(*) from carti c join nrbucati n on c.isbn=n.isbn join imprumuturi i on (n.isbn=i.isbn and n.nr_bucata=i.nr_bucata)
 join clienti cl on i.cnp=cl.cnp group by c.titlu;
 
 
 --titlul cartilor care au fost imprumutate de cele mai putine ori
 select c.titlu from carti c join nrbucati n on c.isbn=n.isbn join imprumuturi i on (n.isbn=i.isbn and n.nr_bucata=i.nr_bucata)
 join clienti cl on i.cnp=cl.cnp group by c.titlu having count(*)=(
 select  min(count(*)) from carti c join nrbucati n on c.isbn=n.isbn join imprumuturi i on (n.isbn=i.isbn and n.nr_bucata=i.nr_bucata)
 join clienti cl on i.cnp=cl.cnp group by c.titlu);
 
 
 --titlul si autorul cartilor imprumutate de cele mai putine ori
 select c.titlu, a.nume from autori a join cartiautori ca on a.id_autor=ca.id_autor 
         join carti c on c.isbn=ca.isbn 
         join nrbucati n on c.isbn=n.isbn join imprumuturi i on (n.isbn=i.isbn and n.nr_bucata=i.nr_bucata)
         join clienti cl on i.cnp=cl.cnp group by c.titlu, a.nume having count(*)=(
         select min(count(*)) from autori a join cartiautori ca on a.id_autor=ca.id_autor 
         join carti c on c.isbn=ca.isbn 
         join nrbucati n on c.isbn=n.isbn join imprumuturi i on (n.isbn=i.isbn and n.nr_bucata=i.nr_bucata)
         join clienti cl on i.cnp=cl.cnp group by c.titlu, a.nume) order by a.nume asc;
         
 --nr de carti pentru fiecare editura        
 select editura, count(*) from carti group by editura order by count(*) desc;     
 
 --cartile si de cate ori au fost imprumutate dupa data de 01-01-2015
 select c.titlu, count(*) from carti c join nrbucati n on c.isbn=n.isbn join imprumuturi i on (n.isbn=i.isbn and n.nr_bucata=i.nr_bucata)
 join clienti cl on i.cnp=cl.cnp where data_imprumut>=to_date('01-01-2015', 'dd-mm-yyyy') group by c.titlu  order by count(*) asc;