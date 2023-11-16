def group_and_count(input)
  return nil if input.empty?
  hash = input.to_h { |ele| [ele, input.count(ele)] }
end

p group_and_count([0,1,1,0])
