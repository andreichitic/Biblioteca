set serveroutput on;

declare
v_id number(6) :=1;
v_count number(2);
begin

for v_carte in (select * from carti) loop
 v_count:=1;
 while(v_count<=v_carte.bucati) loop
   --dbms_output.put_line(v_carte.isbn||' '||v_carte.titlu||' '||v_carte.bucati||' '||v_count);
   insert into nrbucati(id, isbn, nr_bucata) values (v_id, v_carte.isbn, v_count);
   v_id := v_id+1;
   v_count := v_count+1;
 end loop;

end loop;

end;