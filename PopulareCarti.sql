CREATE or replace DIRECTORY USER_DIR AS 'D:\an 2\UNICREDIT'; 
     GRANT READ ON DIRECTORY USER_DIR TO PUBLIC;
     
set serveroutput on;
declare

F1 UTL_FILE.FILE_TYPE; 
v_isbn varchar2(20);
v_titlu varchar2(50);
v_editura varchar2(20);
v_nr number(2);
v_data_publicare date;
v_bucati number(6);
v_disponibilitate number(1);

begin

F1 := UTL_FILE.FOPEN('USER_DIR','carti_un_autor.txt','R'); 

loop
  begin
    UTL_FILE.GET_LINE(F1,v_titlu); 
    dbms_output.put_line(v_titlu);
    select '978-'||round(dbms_random.value(1,9))||'-'
    ||round(dbms_random.value(1,20))||'-'||round(dbms_random.value(100000,999999))||
    '-'||round(dbms_random.value(0,1)) into v_isbn from dual;
     
    v_nr :=trunc(dbms_random.value(1,7));
    case (v_nr)
    when 1 then
      v_editura := 'Corint';
    when 2 then
      v_editura := 'Humanitas';
    when 3 then
      v_editura := 'Art';
    when 4 then
      v_editura := 'Litera';
    when 5 then
      v_editura := 'Teora';
    when 6 then 
      v_editura := 'Nemira';
    end case;
    
    v_data_publicare := to_date(trunc(dbms_random.value(to_char(date '2000-01-01', 'J'), to_char(date '2017-01-01','J'))), 'J');
    
    
    v_bucati := trunc(dbms_random.value(1,10));
    v_disponibilitate := round(dbms_random.value(0,1));
       
    insert into carti (isbn, titlu, editura, data_publicare, bucati, disponibilitate) values (v_isbn, v_titlu, v_editura, v_data_publicare, v_bucati, v_disponibilitate);
    
    
  exception when no_data_found then exit;
  end;
end loop;

UTL_FILE.FCLOSE(F1); 
end;
    