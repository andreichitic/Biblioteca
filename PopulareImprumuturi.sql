set serveroutput on;

declare

v_id_imprumut number(6) :=1;
v_id number(6);
v_count number(6);
v_id_client number(6);
v_isbn varchar2(50);
v_nr_bucata number(6);
v_nr_clienti number(6);
v_cnp varchar2(13);
v_random number(6);
v_data_imprumut date;
v_data_returnare date;
v_adauga_luni number(6);

begin
select count(*) into v_count from nrbucati;
select count(*) into v_nr_clienti from clienti;
while(v_id_imprumut<=150) loop
   v_random := round(dbms_random.value(1,v_count));
   select isbn, nr_bucata into v_isbn, v_nr_bucata from nrbucati where id=v_random;
   
   v_id_client :=round(dbms_random.value(1,v_nr_clienti));
   select cnp into v_cnp from clienti where id_client=v_id_client;
   
   v_data_imprumut := to_date(trunc(dbms_random.value(to_char(date '2010-01-01', 'J'), to_char(date '2017-01-01','J'))), 'J');
   v_adauga_luni :=round(dbms_random.value(1,12));
   v_data_returnare := add_months(v_data_imprumut,v_adauga_luni);
   
  -- dbms_output.put_line(v_id_imprumut||' '||v_isbn||' '||v_nr_bucata||' '||v_cnp||' '||v_data_imprumut||' '||v_data_returnare);
  
  insert into imprumuturi(id_imprumut, isbn, nr_bucata, cnp, data_imprumut, data_returnare) values (v_id_imprumut, v_isbn, v_nr_bucata,v_cnp, v_data_imprumut, v_data_returnare);
   v_id_imprumut := v_id_imprumut +1;
   
   
end loop;

end;

