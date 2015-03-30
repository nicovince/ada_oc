with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO ;
use Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO ;

procedure mean is
  n : constant natural:=5;
  subtype t_grade is float range 0.0..20.0;
  type t_grades is array(1..n) of t_grade;
  grades : t_grades;
  sum : float:=0.0;
begin
  for i in grades'range loop
    put("grade student "); put(i, width=>0); put(" : ");
    get(grades(i)); skip_line;
  end loop;

  for i in grades'range loop
    sum := sum + grades(i);
  end loop;
  put(sum/float(grades'length), fore=>2, aft=>2, exp=>0);
end mean;
