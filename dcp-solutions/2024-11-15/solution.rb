```ruby
def unbiased_coin_toss(toss_biased_probability)
  probability = (toss_biased_probability + 1) / 2
  toss_biased_probability >= probability ? 0 : 1
end
```