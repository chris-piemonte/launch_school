ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# ages_sum = 0
# ages.each { |name, age| ages_sum += age }

p ages.values.inject(:+)
