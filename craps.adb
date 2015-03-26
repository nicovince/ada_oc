WITH Ada.Numerics.Discrete_Random ;
with ada.text_io,
     ada.integer_text_io;
use ada.text_io,
    ada.integer_text_io;

procedure Craps IS

  SUBTYPE DiceRange IS Integer RANGE 1..6 ;
  subtype Sum2DiceRange is Integer Range 2..12;
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

  -- Roll dices and return sum of the two values
  -- Display individual numbers as well as the sum
  function rollDices(seed:Generator) return Sum2DiceRange is
    sum : Sum2DiceRange;
    d1 : DiceRange;
    d2 : DiceRange;
  begin
    d1 := random(seed);
    d2 := random(seed);

    sum := d1+d2;
    put("Rolled dice, got ");
    put(d1);
    put(" and ");
    put(d2);
    put(" = ");
    put(sum);
    new_line;
    return sum;
  end rollDices;

  -- Start playing the first round with the given bet.
  -- play second round if necessary.
  -- return amount of money won/lost (negative amount when losing)
  function playFirstRound(bet:natural) return integer is
    sum : Sum2DiceRange;
  begin
    --sum := rollDices(seed);
    return -bet;
  end playFirstRound;

  money : natural:=50; -- Available money for the game
  bet : natural:=1; -- amount of money the player is betting

  seed  : Generator;
begin
  reset(Seed);

  while money /= 0 loop
    bet := doBet(money);
    if bet > 0 then
      put_line("let's play");
      money := money + playFirstRound(bet);
    else
      put_line("ok bye");
      exit;
    end if;
  end loop;
  put("You finished the game with ");
  put(money);
  put_line("$");
end Craps;
