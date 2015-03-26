WITH Ada.Numerics.Discrete_Random ;
with ada.text_io,
     ada.integer_text_io;
use ada.text_io,
    ada.integer_text_io;

procedure Craps IS

  SUBTYPE DiceRange IS Integer RANGE 1..6 ;
  PACKAGE DiceRandom IS NEW Ada.Numerics.Discrete_Random(DiceRange);
  USE DiceRandom;

  -- Return the amount of money player want to bet
  -- keep asking while bet value is greater than available money given in arg
  function doBet(money : natural) return natural is
    bet : natural;
  begin
    put("How much money do you want to bet ($");
    put(money);
    put(") : ");
    get(bet); skip_line;
    while (bet > money) loop
      put("Invalid value, enter bet value lower than ");
      put(money);
      put(" : ");
      get(bet); skip_line;
    end loop;
    return bet;
  end doBet;

  money : natural:=50; -- Available money for the game
  bet : natural:=1; -- amount of money the player is betting

  Seed  : Generator;
begin
  reset(Seed);

  while money /= 0 loop
    bet := doBet(money);
    if bet > 0 then
      put_line("let's play");
      money := money - bet;
    else
      put_line("ok bye");
      exit;
    end if;
  end loop;
  put("You finished the game with ");
  put(money);
  put_line("$");
end Craps;
