with ada.text_io,
ada.float_text_io,
ada.integer_text_IO; 
use ada.text_io,
ada.float_text_io,
ada.integer_text_io; 

procedure operations is
  val : integer;
  val_x2 : integer;
  val_x3 : integer;
  val_x5 : integer;
begin
  put("Val ? ");
  get(val); skip_line;
  val_x2 := val * 2;
  val_x3 := val_x2 + val;
  val_x5 := val_x2 * 2 + val;
  put("2xval : "); put(val_x2); new_line;
  put("3xval : "); put(val_x3); new_line;
  put("5xval : "); put(val_x5); new_line;
end operations;
