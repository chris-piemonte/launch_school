class Tree
  include Enumerable

  def each(collection)
    counter = 0

    while counter < collection.size do
      yield(collection[0])
      counter += 1
    end

    collection
  end
end
