require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'to_do_list'

class TodoListTest < Minitest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_fist
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(todo, @todo1)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(todo, @todo3)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
  end
 
  def test_type_error
    assert_raises(TypeError) { @list.add(5) }
    assert_raises(TypeError) { @list << 'test' }
  end

  def test_push
    todo4 = Todo.new("test")
    @list << todo4
    @todos << todo4

    assert_equal(@todos, @list.to_a)
  end

  def test_push2
    todo4 = Todo.new("test")
    @list.add(todo4)
    @todos << todo4

    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(3) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(3) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) {@list.mark_undone_at(50) }
    @list.mark_done_at(1)
    @list.mark_undone_at(1)
    assert_equal(false, @todo2.done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(3) }
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    output = <<~OUTPUT.chomp
    Today's Todos
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT
  
    assert_equal(output, @list.to_s)
  end

  def test_to_s_two
    @list.mark_done_at(0)

    output = <<~OUTPUT.chomp
    Today's Todos
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_three
    @list.done!

    output = <<~OUTPUT.chomp
    Today's Todos
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_each
    b = [@todo1.object_id, @todo2.object_id, @todo3.object_id,]
    a = []
    @list.each { |todo| a << todo.object_id }
    assert_equal([@todo1.object_id, @todo2.object_id, @todo3.object_id,], a )
  end

  def test_each_two
    assert_equal(@list, @list.each {})
  end

  def test_select
    @list.mark_done_at(1)
    assert_equal(@todo2, @list.select { |item| item.done? }.item_at(0))
    assert_equal(false, @list == @list.select { |item| item.done? })
  end

  def test_find_by_title
    assert_equal(@todo1, @list.find_by_title('buy milk'))
  end

  def test_all_done
    @list.mark_done_at(1)
    @list.mark_done_at(2)
    assert_equal([@todo2, @todo3], @list.all_done.to_a)
  end

  def test_all_not_done
    @list.mark_done_at(1)
    assert_equal([@todo1, @todo3], @list.all_not_done.to_a)
  end

  def test_mark_done
    @list.mark_done("clean room")
    assert_equal(true, @todo2.done)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal([@todo1, @todo2, @todo3], @list.all_done.to_a)
  end

  def test_mark_all_undone
    @list.mark_all_done
    @list.mark_all_undone
    assert_equal([@todo1, @todo2, @todo3], @list.all_not_done.to_a)
  end
end

