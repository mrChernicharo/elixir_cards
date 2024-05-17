defmodule ElixirCards do
  @moduledoc """
  Documentation for `ElixirCards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ElixirCards.hello()
      :world

  """
  def main do
    IO.puts("\nload my previous hand\n")
    prev_cards = Cards.load("./junk/my_deck")
    IO.inspect(prev_cards)

    IO.puts("\nok, now create me a new deck\n")
    cards = Cards.create_deck()
    IO.inspect(cards)

    IO.puts("\nshuffle it! \n")
    cards = Cards.shuffle(cards)
    IO.inspect(cards)

    hand_size = 7
    {my_hand, remaining_cards} = Cards.deal(cards, hand_size)

    IO.puts("\nNow deal me a hand of #{hand_size} cards\n")
    IO.inspect(my_hand)

    IO.puts("\nAnd this is the rest of the cards\n")
    IO.inspect(remaining_cards)

    IO.puts("\ndo I have an ♠️ A?")
    IO.puts(Cards.contains?(my_hand, "♠️ A"))

    IO.puts("\ndo I have a ♦️ 6?")
    IO.puts(Cards.contains?(my_hand, "♦️ 6"))

    IO.puts("\nOk, now please Save my deck for the next round\n")
    # uuid = UUID.uuid4()
    Cards.save(my_hand, "./junk/my_deck")

    # IO.puts("")
    # IO.puts("")
    # IO.puts("")
    # IO.puts("")
  end
end
