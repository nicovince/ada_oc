with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO ;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO ;

procedure mean is
  n : constant natural:=5;
  subtype t_grade is natural range 0..20;
  type t_grades is array(1..n) of t_grade;
  grades : t_grades;
  sum : natural:=0;
begin
  for i in grades'range loop
    put("grade student "); put(i, width=>0); put(" : ");
    get(grades(i)); skip_line;
  end loop;

  for i in grades'range loop
    sum := sum + grades(i);
  end loop;
  put(sum/grades'length);


end mean;
