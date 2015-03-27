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
  seed  : Generator;

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
    put(d1, width=>0);
    put(" and ");
    put(d2, width=>0);
    put(" = ");
    put(sum, width=>0);
    new_line;
    return sum;
  end rollDices;

  -- Start playing second round with given bet and target sum
  -- return amount of money won/lost
  function playSecondRound(bet:natural;
    sum:Sum2DiceRange) return integer is
    sum2 : Sum2DiceRange;
  begin
    sum2 := rollDices(craps.seed);
    -- stop when rolling 7 or previous sum
    while (sum2 /= sum and sum2 /= 7) loop
      sum2 := rollDices(craps.seed);
    end loop;

    -- lose/win
    if sum2 = 7 then
      -- lose bet
      return -bet;
    else
      -- win bet
      return bet;
    end if;
  end playSecondRound;


  -- Start playing the first round with the given bet.
  -- play second round if necessary.
  -- return amount of money won/lost (negative amount when losing)
  function playFirstRound(bet:natural) return integer is
    sum : Sum2DiceRange;
  begin
    sum := rollDices(craps.seed);
    case sum is
      when 7 | 11 => return bet;
      when 2 | 3 | 12 => return -bet;
      when others => return playSecondRound(bet, sum);
    end case;
  end playFirstRound;

  money : natural:=50; -- Available money for the game
  bet : natural:=1; -- amount of money the player is betting

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
