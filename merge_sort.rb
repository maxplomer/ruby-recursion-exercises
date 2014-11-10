def merge_sort(array)
  return array if array.size < 2
  result = []
  imid = array.size / 2
  left = merge_sort(array[0...imid])
  right = merge_sort(array[imid..-1])
  while true
    result << (left.first < right.first ? left.shift : right.shift)
    break if left.empty? || right.empty?
  end

  result + left + right
end


p merge_sort([1,6,2,3,4])