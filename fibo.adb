with ada.text_io,
ada.float_text_io,
Ada.Numerics,
ada.integer_text_IO; 
use ada.text_io,
ada.float_text_io,
ada.numerics,
ada.integer_text_io; 

procedure fibo is
  n1 : integer:=0;
  n2 : integer:=1;
  n : integer;
  f : integer;
begin
  put("n : ");
  get(n); skip_line;
  if (n = 0) then
    put(n1);
  elsif (n = 1) then
    put(n2);
  else
    for i in 1..n loop
      f := n2 + n1;
      n2 := n1;
      n1 := f;
    end loop;
    put(f);
  end if;


end fibo;
