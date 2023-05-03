a = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

b = a.map do |hash|
  temporary_hash = {}

  hash.each do |k, v|
    temporary_hash[k] = v + 1
  end

  temporary_hash
end

p b
