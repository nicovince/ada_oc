with ada.text_io,
ada.float_text_io,
Ada.Numerics,
ada.integer_text_IO; 
use ada.text_io,
ada.float_text_io,
ada.numerics,
ada.integer_text_io; 

procedure letter is
  c1 : character;
  c2 : character;
  m : character;
begin
  put("c1 : ");
  get(c1);skip_line;

  put("c2 : ");
  get(c2);skip_line;

  -- check letters are lower case :
  if ((character'pos(c1) >= character'pos('a')) and
      (character'pos(c1) <= character'pos('z')) and
      (character'pos(c2) >= character'pos('a')) and
      (character'pos(c2) <= character'pos('z'))) then
    put(c1); put(" -> "); put(character'val(character'pos(c1) - 32)); new_line;
    put(c2); put(" -> "); put(character'val(character'pos(c2) - 32)); new_line;
    m := character'val((character'pos(c1) + (character'pos(c2)))/2);
    put("middle : "); put(m); new_line;
  end if;


end letter;
