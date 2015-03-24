with ada.text_io,
ada.float_text_io,
ada.integer_text_IO; 
use ada.text_io,
ada.float_text_io,
ada.integer_text_io; 

procedure opdiv is
  n : integer;
  d : integer;
begin
  put("n : ");
  get(n); skip_line;
  put("d : ");
  get(d); skip_line;
  put("Q = "); put(n/d); new_line;
  put("R = "); put(n mod d); new_line;
end opdiv;
