def merge_sort(array)
  result = []
  imid = (array.size - 1) / 2

  if array.length > 2
    left = merge_sort(array[0...imid])
    right = merge_sort(array[imid..-1])
  else
    left = [array.min]
    right = [array.max]
  end

  while true
    if left.first < right.first
      result << left.shift
    else
      result << right.shift
    end
    break if left.empty? || right.empty?
  end

  result + left + right
end


p merge_sort([1,6,2,3,4])