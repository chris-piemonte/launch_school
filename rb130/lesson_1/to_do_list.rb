require 'pry'

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title, :todos

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(to_do)
    raise TypeError.new('Can only add Todo objects') if to_do.class != Todo
    todos << to_do
  end

  def <<(to_do)
    add(to_do)
  end

  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def to_a
    todos
  end

  def done?
    todos.all? { |task| task.done }
  end

  def item_at(ind)
    raise IndexError if ind > todos.size - 1
    todos[ind]
  end

  def done!
    todos.size.times { |ind| mark_done_at(ind) }
  end

  def mark_done_at(ind)
    raise IndexError if ind > todos.size - 1
    todos[ind].done = true
  end

  def mark_undone_at(ind)
    raise IndexError if ind > todos.size - 1
    todos[ind].done = false
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(ind)
    raise IndexError if ind > todos.size - 1
    todos.delete_at(ind)
  end

  def each
    todos.each { |item| yield(item) }
    self
  end

  def select
    new_list = TodoList.new(title)
    each { |item| new_list << item if yield(item) }
    new_list
  end

  def find_by_title(string)
    select { |item| item.title.downcase == string.downcase }.first
  end

  def all_done
    select { |item| item.done? }
  end

  def all_not_done
    select { |item| !item.done? }
  end

  def mark_done(string)
    # each { |item| item.done! if item.title.downcase == string.downcase }
    find_by_title(string).done! if find_by_title(string)
  end

  def mark_all_done
    each { |item| item.done! }
  end

  def mark_all_undone
    each { |item| item.undone! }
  end

  def to_s
    text = "#{title}\n"
    text << todos.map(&:to_s).join("\n")
    text
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)
