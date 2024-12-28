```ruby
def max_profit(prices)
  return 0 if prices.empty?
  min_price = prices[0]
  max_profit = 0
  
  prices.each do |price|
    min_price = price if price < min_price
    profit = price - min_price
    max_profit = profit if profit > max_profit
  end
  
  max_profit
end
```