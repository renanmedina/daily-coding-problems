```python
def shuffleDeck(deck, k):
    def rand_index():
        nonlocal seed
        seed = (seed * 3 + 1) % k
        return deck.index(deck[seed])

    deck_copy = deck[:]
    random.seed(seed)
    for i in range(len(deck) - 1, 0, -1):
        j = rand_index()
        deck[i], deck[j] = deck[j], deck[i]
```