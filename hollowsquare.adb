with ada.text_io;
use ada.text_io;


procedure hollowsquare is 
begin
  for l in 1..5 loop
    for c in 1..5 loop
      if (l = 1) or (l=5) then
        put("#");
      elsif (c = 1) or (c=5) then
        put("#");
      else
        put(" ");
      end if;
    end loop;
    new_line;
  end loop;
end hollowsquare;
