with ada.text_io;
use ada.text_io;

procedure triangle is
begin
  for h in 1..6 loop
    for b in 1..h loop
      put("#");
    end loop;
    new_line;
  end loop;
end triangle;
