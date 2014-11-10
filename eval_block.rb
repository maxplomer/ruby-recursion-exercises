def eval_block(*args, &prc)
  raise "NO BLOCK GIVEN" if prc.nil?
  prc.call(*args)
end

eval_block(1,2,3) {|*i| puts i}
eval_block(1,2,3)