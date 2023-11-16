def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

p spin_me("hello world") # "olleh dlrow"


# it returns a new object because once `str` is turned into an array with `String#split it is no longer the same object
