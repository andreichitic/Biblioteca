CREATE or replace DIRECTORY USER_DIR AS 'D:\an 2\UNICREDIT'; 
     GRANT READ ON DIRECTORY USER_DIR TO PUBLIC;
     
set serveroutput on;
declare

F1 UTL_FILE.FILE_TYPE;
F2 UTL_FILE.FILE_TYPE;

v_nume varchar2(50);
v_id_client number(6):=1;
v_cnp varchar2(13);
v_email varchar2(50);
v_adresa varchar2(50);
begin

F1 := UTL_FILE.FOPEN('USER_DIR','nume_clienti_barbati.txt','R'); 
F2 := UTL_FILE.FOPEN('USER_DIR','adrese.txt','R'); 

loop
  begin
     UTL_FILE.GET_LINE(F1,v_nume);
     UTL_FILE.GET_LINE(F2,v_adresa); 
  
     v_cnp := '1'||round(dbms_random.value(50,99))||'0'||round(dbms_random.value(1,9))||round(dbms_random.value(10,28))||round(dbms_random.value(100000,999999));
     v_email := replace(lower(v_nume), ' ')||round(dbms_random.value(10,90))||'@yahoo.com';
     
     insert into clienti (id_client, cnp, nume, adresa, email) values (v_id_client, v_cnp, v_nume, v_adresa, v_email);
     
     v_id_client :=v_id_client +1;
     exception when no_data_found then exit;
  end;
end loop;

UTL_FILE.FCLOSE(F1); 
UTL_FILE.FCLOSE(F2);


end;
