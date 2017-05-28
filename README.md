# Biblioteca

Scripturile vor fi executate in urmatoarea ordine:
1. Creare tabele
2. PopulareCarti
3. PopulareAutori
4. PopulareCartiAutori
5. carti_cu_mai_multi_autori
6. PopulareClienti
7. PopulareBucati
8. PopulareImprumuturi
9. exemple_joinuri

Baza de date Biblioateca are urmatoarele tabele:
  <p>Carti cu urmatoarele campuri isbn, titlu, editura, data_publicare, nr_bucati, disponibilitate</p>
  <p>CartiAutori(isbn, id_autor) este o tabela triviala care rezolva relatia many to many dintre carti si autori
  <p>Autori (id_autor, cnp, nume, adresa, email) </p>
  <p>NrBucati (id, isbn, id_imprumut) este o tabela care ajuta la diferentierea cartilor de acelasi fel deoarece o carte avand mai multe exemplare are acelasi isbn si ar fi fost o problema sa stim care carte a fost imprumutata din cele care fac parte din acelasi exemplar</p>
   <p>Imprumuturi(id_imprumut, isbn, nr_bucata, cnp, data_imprumut, data_returnare) pastreaza un istoric al imprumuturilor pe care le face un client</p>
   <p>Client(id_client, cnp, nume, adresa, email) este o tabela care retine clientii bibliotecii</p>
