# rubocop:disable Layout/LineLength
=begin

PROBLEMCreate a singly linked list whose elemnts may contain a range of data.
Provide methods to reverse the linked list and convert a linked list to and from an array.

input: element and list classes, list instances should be element collaboration objects
output: manipulation of the element and list instances

rules:
  explicit:
    - make a `SimpleLinkedList` class whose objects are linked lists
      - elements of linked list should be custom `Element` class objects

DATA
- SimpleLinkedList class
  - `push(num)` instance variable
  - `size` instance variable
  - `peak` instance variable`
  - `head` instance varibale
  - `pop` instance variable
  - `size` instance variable
  - `from_a(object)` instance method
  - `to_a` instance method
  - `reverse` instance method
- `Element` class
  - `datum` instance variable
  - `tail?` instance variable
  - `next` instance variable

ALGORITHM
- define a class `Element`
  - define a constuctor method `initialize(num)
    - assign to `@ele`
  - define an instance method `datum`
    - return `@ele`
  - define an instance method `tail?`
    - return true if @ele isn't nil
  - define an instance method `next`
    - increment `@ele` by 1
      - wrap around or stop at 10??? (wrap around)

- define a class SimpleLinkedList
  - define a constructor method `initialize(array=[])`
    - assign @list` to the input array
  - define an instiance method `push(num)`
    - push the argument `num` into an array
  - define an instance method `size`
    - return the size of the array
  - define an instance method `peak`
    - return the first element of the array
  - define an instance method `head`
    - rturn the last element in the array
  - define an instance method pop
    - return and remove the last element in the array
  - define a class method `from_a(object)`
    - instantiate a new `SimpleLinkedList with `object` passed in to the constructor method
  - define a method `to_a`
    - return `@list`
  - define an instance method `reverse`
    - reverse the `@list` array
=end
# rubocop:enable Layout/LineLength

class Element
  attr_reader :datum, :next

  def initialize(datum, next_element=nil)
    @datum = datum
    @next = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def empty?
    @head.nil?
  end

  def push(datum)
    @head = Element.new(datum, @head)
  end

  def size
    size = 0
    current_element = head
    while current_element
      size += 1
      current_element = current_element.next
    end
    size
  end

  def peek
    head&.datum
  end

  def pop
    popped_element = peek
    @head = @head.next
    popped_element
  end

  def self.from_a(array)
    array = [] if array.nil?

    list = SimpleLinkedList.new
    array.reverse_each { |datum| list.push(datum) }
    list
  end

  def to_a
    array = []

    current_element = head
    while !current_element.nil?
      array.push(current_element.datum)
      current_element = current_element.next
    end

    array
  end

  def reverse
    reversed_list = SimpleLinkedList.new

    current_element = head
    while !current_element.nil?
      reversed_list.push(current_element.datum)
      current_element = current_element.next
    end

    reversed_list
  end
end
