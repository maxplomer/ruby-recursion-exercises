def exp(base, pow)
  return 1 if pow == 0
  return 0 if base == 0
  base * exp(base, pow - 1)
end

p exp(3,5)

#overriding default for **
class Integer
  def **(other)
    exp(self, other)
  end
end

p 3**5
p 0**0
p 0**5

def exp2(base, pow)
  return 1 if pow == 0
  return 0 if base == 0

  if n.even?
    exp2(base, pow / 2) * exp(base, pow / 2)
  else
    base * exp2(base, pow - 1) #reduced version
    #base * exp2(base, (pow - 1) / 2) * exp2(base, (pow - 1) / 2)   #long version
  end

end
