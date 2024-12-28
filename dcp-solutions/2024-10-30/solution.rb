```ruby
def shuffleDeck(deck)
  n = deck.size
  random_index = n.times.to_a.shuffle.first
  i = n - 1
  (n - 1).downto(random_index) do |j|
    deck[i], deck[j] = deck[j], deck[i]
    i -= 1
  end
end
```