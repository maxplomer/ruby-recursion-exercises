def make_change(value, coins)
  return [] if value == 0
  best = [1]*value
  coins.each do |coin|
    if coin <= value
      trial = [coin] + make_change(value - coin, coins)
      if trial.length < best.length
        best = trial
      end
    end
  end
  best
end



p make_change(14, [10,7,1])
p make_change(88,[80,42,3,1])