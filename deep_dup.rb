def deep_dup(obj)
  if obj.is_a?(Array)
    return obj.map {|el| deep_dup(el)}
  end

  my_dup(obj) #could just have:    obj
end


#def my_dup(obj)
#  Marshal.load(marshal.dump(obj)) #hacky way
#end

def my_dup(obj)
  return obj if obj.is_a?(Numeric)
  copy = (obj.class).new
  x = obj.instance_variables
  x.each do |var_name| #copy attributes
    y = obj.instance_variable_get(var_name.to_sym)
    copy.instance_variable_set(var_name.to_sym, y)
  end
  copy
end


x = [1, [2], [3, [4]]]

y = deep_dup(x)

p y
p x.object_id
p y.object_id


