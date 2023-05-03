munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# males = munsters.select { |k, v| v["gender"] == "male" }
# p males.sum { |k, v| v["age"] }

male_age = 0
munsters.each_value do |details|
  male_age += details["age"] if details["gender"] == "male"
end

puts male_age
