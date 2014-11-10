def subsets(array)
  return [[]] if array == []
  old = subsets(array[0...-1]) #array=[1,2] and old = [],[1],[2],[1,2]
  old + old.map {|sub| sub + [array.last]}
end

p subsets([1, 2, 3])