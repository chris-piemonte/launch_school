munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, categories|
  case categories["age"]
  when (0..17) then categories["age_group"] = "kid"
  when (18..64) then categories["age_group"] = "adult"
  when (65..) then categories["age_group"] = "senior"
  end
end

p munsters

# case categories["age"]
# when (0..17) then name["age_group"] = "kid"
# when (18..64) then name["age_group"] = "adult"
# when (65..1000) then name["age_group"] = "senior"
# end
