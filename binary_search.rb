def binary_search(array,value)
  i_mid = (array.length - 1) / 2
  if array[i_mid] < value
    return binary_search(array[i_mid..-1], value) + i_mid
  elsif array[i_mid] > value
    return binary_search(array[0..i_mid], value)
  else
    puts "we found it!"
    return i_mid
  end
end

p binary_search([0,1,2,3,4,5], 3)
