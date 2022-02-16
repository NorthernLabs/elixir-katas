defmodule ElixirKatas.OTP.ShoppingCart do
  @moduledoc """
  This module models a shopping cart.

  You can add `%ShoppingCart.Item{}` to it and ask for the total cost of the items.

  Using a `GenServer`, implement the following functions:
  - `start_link/0` - Starts an empty shopping cart process
  - `put_item/2` - Adds an item to the given shopping cart (pid)
  - `running_cost/1` - Returns the cost of all the items in the shopping cart
  - `purchase/1` - Takes a shopping cart and purchases all items. Prints the cost and exits the process

  ## Examples

    iex> shopping_cart = ShoppingCart.start_link()
    #PID<0.119.0>

    iex> ShoppingCart.put_item(shopping_cart, %ShoppingCart.Item{name: "soda", price: 1.00})
    :ok

    iex> ShoppingCart.running_cost(shopping_cart)
    1.0

    iex> ShoppingCart.purchase(shopping_cart)
    "Total cost is $1.00"
  """

  defmodule Item do
    @enforce_keys [:name, :price]
    defstruct [:name, :price]
  end

  use GenServer

  def start_link() do
    :answer
  end

  def put_item(shopping_cart, %Item{} = item) do
    :answer
  end

  def running_cost(shopping_cart) do
    :answer
  end

  def purchase(shopping_cart) do
    :answer
  end

  ## GenServer callbacks
end
