with ada.text_io,
ada.float_text_io,
Ada.Numerics,
ada.integer_text_IO; 
use ada.text_io,
ada.float_text_io,
ada.numerics,
ada.integer_text_io; 

procedure circle is
  r : integer;
begin
  put("r : ");
  get(r); skip_line;
  put("perimeter : "); put(float(2*r)*Pi, exp=>0, aft=>2); new_line;
  put("area : "); put(Pi*float(r**2), exp=>0, aft=>2); new_line;
end circle;
