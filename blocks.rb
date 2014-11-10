class Array
  def my_each(&prc)
    0.upto(self.length-1) do |i|
      prc.call(self[i])
    end

    self
  end

  def my_map(&prc)
    new_array = []
    0.upto(self.length-1) do |i|
      new_array << prc.call(self[i])
    end

    new_array
  end

  def my_map2(&prc)
    new_array = []
    my_each do |el|
      new_array << proc.call(el)
    end

    new_array
  end

  def my_select(&prc)
    new_array = []
    0.upto(self.length-1) do |i|
      new_array << self[i] if prc.call(self[i])
    end

    new_array
  end

  def my_select2(&prc)
    new_array = []
    my_each do |el|
      new_array << el if prc.call(el)
    end

    new_array
  end

end

a = [1,2,3]

a.my_each {|i| puts i}

p a.my_map2 {|i| i + 1}

p a.my_select {|i| i == 2}