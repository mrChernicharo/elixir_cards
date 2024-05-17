defmodule Cards do
  def create_deck do
    cards = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
    suits = ["♦️", "♠️", "♥️", "♣️"]

    for card <- cards, suit <- suits do
      "#{suit} #{card}"
    end
  end

  def shuffle(cards) do
    Enum.shuffle(cards)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filepath) do
    binary = :erlang.term_to_binary(deck)
    File.write(filepath, binary)

    case File.write(filepath, binary) do
      :ok ->
        IO.puts("Hand Saved Successfully")

      {:error, _} ->
        IO.puts("Error. Could not save the deck")
    end
  end

  def load(filepath) do
    case File.read(filepath) do
      {:ok, binary} ->
        :erlang.binary_to_term(binary)

      {:error, _} ->
        IO.puts("Error. File doesn't exist")
    end
  end
end

# this will produce nested arrays ❌
# for card <- cards do
#   for suit <- suits do
#     "#{suit} #{card}"
#   end
# end

# this will make a single array ✅
# for card <- cards, suit <- suits do
#   "#{suit} #{card}"
# end
