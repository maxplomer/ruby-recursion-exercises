def fib(n)
  return [1] if n == 1
  return [1,1] if n == 2
  x = fib(n - 1)
  x + [x[-1] + x[-2]]
end

def fib2(n)
  return [1] if n == 1
  return [1,1] if n == 2
  result = [1,1]
  (n-2).times do
    result << result[-1] + result[-2]
  end
  result
end


p fib(5)


