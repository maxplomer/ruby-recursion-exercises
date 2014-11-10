def make_change(n, coins)
  $best = [1] * n

  make_change_work(n, coins, [])

  $best
end


def make_change_work(n, coins, change)
  if n == 0
    if change.size < $best.size
      $best = change
    end
    return
  end
  coins.each do |coin|
    next if coin > n
    make_change_work(n - coin, coins, change + [coin])
  end

  nil
end

p make_change(14, [10,7,1])
