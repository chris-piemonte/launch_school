class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
puts oracle.predict_the_future

# It will return "You will" and a random string from the array in the `choices` method.
