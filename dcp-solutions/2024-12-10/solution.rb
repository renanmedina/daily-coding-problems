```ruby
functions = []
for i in (0..9)
  functions << proc { |i| i }
end
for f in functions
  p f.call
end
```

In this Ruby version, we're using a `proc` instead of a lambda. The reason is that lambdas are evaluated at runtime, whereas `proc`s are compiled ahead of time.

This way, the value of `i` inside each closure is preserved until it's actually called, which is what we want for this problem.