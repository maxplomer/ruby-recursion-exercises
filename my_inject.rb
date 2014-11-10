#[1, 2, 3].inject { |sum, num| sum + num }



class Array
  def my_inject(&prc)
    memory = self.first
    flag = true
    self.each do |el|
      if flag
        flag = false
        next
      end
      memory = prc.call(memory,el)
    end

    memory
  end

  def my_sort!(&prc)
    sorted = false

    until sorted
      sorted = true
      self.each_index do |i|
        next if i == 0

        if prc.call(self[i - 1], self[i]) == 1
          self[i - 1], self[i] = self[i], self[i - 1]
          sorted = false
        end
      end

    end
    self
  end

  def my_sort(&prc)
    duplicate = self.dup
    duplicate.my_sort!(&prc)
  end
end






p [1, 2, 3].my_inject { |sum, num| sum + num }

p [1, 3, 5].my_sort! { |num1, num2| num1 <=> num2 }
p [1, 3, 5].my_sort { |num1, num2| num2 <=> num1 }