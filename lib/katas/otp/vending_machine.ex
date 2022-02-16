defmodule ElixirKatas.OTP.VendingMachine do
  @moduledoc """
  This module implements a simple vending machine.

  It will accept valid coins (nickels, dimes, and quarters) and reject invalid ones (pennies).
  Coin values:
  - pennies - 1 cent
  - nickel - 5 cents
  - dime - 10 cents
  - quarter - 25 cents

  When a valid coin is inserted the amount of the coin will be added to the current amount and the display will
  be updated. When there are no coins inserted, the machine displays `:insert_coin`.
  Rejected coins are placed in the coin return.

  There are 3 products:
  - cola - $1.00
  - chips - $0.50
  - candy - $0.65

  When a product is selected that costs less than the amount of money in the machine, then the remaining amount is
  placed in the coin return.
  When the return coins button is pressed, the money the customer has placed in the machine is returned and the
  display shows `:insert_coin`.

  When the item selected by the customer is out of stock, the machine displays `:sold_out` for 5 seconds. After that,
  it will display the amount of money remaining in the machine or `:insert_coin` if there is no money in the machine.

  When the machine is not able to give change for any of the items that it sells, it will display `:exact_change_only`
  instead of `:insert_coin`.

  For this kata consider using a `GenServer` or the `gen_statem` behaviour.

  References:

  - Adapted from the original kata https://sammancoaching.org/kata_descriptions/vending_machine.html
  """
end
