with ada.text_io,
ada.float_text_io,
ada.integer_text_IO; 
use ada.text_io,
ada.float_text_io,
ada.integer_text_io; 


procedure yourAge is
  age: integer := 31;
  weight : float := 61.971;
  c : character;
begin
  put("age ? ");
  --get(age);
  put("weight ? ");
  --get(weight);
  --skip_line;
  put("You are ");
  put(age, width => 0);
  put_line(" years old");
  put("and you weigh ");
  put(weight, exp=>0, aft=>2);
  new_line;
  put(integer'first);
  put(natural'first);
  put(character'pos('a'));
  put(character'val(97));
end yourAge;
