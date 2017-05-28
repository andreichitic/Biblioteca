CREATE or replace DIRECTORY USER_DIR AS 'D:\an 2\UNICREDIT'; 
     GRANT READ ON DIRECTORY USER_DIR TO PUBLIC;
     
set serveroutput on;
declare

F1 UTL_FILE.FILE_TYPE;
v_nume varchar2(50);
v_id_autor number(6):=0;

begin

F1 := UTL_FILE.FOPEN('USER_DIR','Autori.txt','R'); 

loop
  begin
    UTL_FILE.GET_LINE(F1,v_nume); 
    v_id_autor := v_id_autor+1;
    

    insert into autori (id_autor, nume) values (v_id_autor, v_nume);
  exception when no_data_found then exit;
  end;
end loop;

UTL_FILE.FCLOSE(F1);

end;

