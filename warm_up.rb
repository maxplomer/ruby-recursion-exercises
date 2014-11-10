def range(start, fin)
  return [] if start > fin
  [start, *range(start + 1, fin)]
end

def arr_sum_rec(array, index = 0) #needs troubleshooting
  return array[index] if array.size == 1
  array[index] + arr_sum_rec(array[(index + 1)..-1], index + 1).to_i
end

def arr_sum_rec2(array)
  return nil if array.empty?
  puts "hey there"
  array.first + arr_sum_rec2(array.dup[1..-1]).to_i # not destroying
end


def arr_sum_rec3(array) #not tested probably wont work
  array.shift + arr_sum_rec3(array) #warning destroying array
end



def arr_sum_iter(array)
  return nil if array.empty?
  sum = 0

  array.each do |el|
    sum += el
  end

  sum
end

#p range(1,10)  #[1,2,3,4,5,6,7,8,9,10]
#p range(4,1)  # []
#p range(1,1) # [1]

#p arr_sum_rec2([])
#p arr_sum_rec2([1,2,3])
p arr_sum_iter([1,2,3])