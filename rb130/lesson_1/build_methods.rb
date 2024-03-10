def times(number)
  counter = 0
  while counter < number do
    yield(counter)
    counter += 1
  end

  number
end

def each(array)
  counter = 0

  while counter < array.size
    yield(array[counter])
    counter += 1
  end

  array
end

def select(array)
  counter = 0
  new_array = []

  while counter < array.size
    new_array << array[counter] if yield(array[counter])
    counter += 1
  end

  new_array
end

def reduce(array, acc=nil)
  counter = 0
  if acc == nil
    acc = array[0]
    counter = 1
  end

  while counter < array.size
    acc = yield(acc, array[counter])
    counter += 1
  end

  acc
end
