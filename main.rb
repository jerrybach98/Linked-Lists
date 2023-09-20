class LinkedList
  attr_accessor :tail, :head

  def initialize
    @head = nil
    @tail = nil
    @list_size = 0
  end

  # Add nodes to end, create new head if empty, and new nodes get pointed to
  def append(value)
    if @head.nil?
      @head = Node.new(value, nil)
    else
      current_node = @head
      current_node = current_node.next_node until current_node.next_node.nil?
      # at end of list
      current_node.next_node = Node.new(value, nil)
    end
  end

  # Adds new head to beginning
  def prepend(value)
    if @head.nil?
      @head = Node.new(value, nil)
    else
      old_head = @head
      @head = Node.new(value, old_head)
    end
  end

  # Iterate through nodes and count
  def size
    current_node = @head
    while current_node
      current_node = current_node.next_node
      @list_size += 1
    end
    puts "Linked list size: #{@list_size}"
  end

  def head_value
    @head.value
    puts "Head value: #{@head.value}"
  end

  def tail_value
    current_node = @head
    until current_node.next_node.nil?
      current_node = current_node.next_node
      @tail = current_node
    end
    @tail.value
    puts "Tail value: #{@tail.value}"
  end

  def at(index)
    current_node = @head
    counter = 0
    until counter == index
      current_node = current_node.next_node
      counter += 1
    end

    if current_node.nil?
      puts "Node does not exist at index #{index}"
    else
      puts "Node at index #{index}: #{current_node.value}"
    end
  end

  # Remove last node by pointing second to last node to nil
  def pop
    current_node = @head
    until current_node.next_node.nil?
      previous_node = current_node
      current_node = current_node.next_node
    end
    puts "Last node removed: #{current_node.value}"
    previous_node.next_node = nil
  end

  # Iterate through to check for value
  def contains?(value)
    current_node = @head
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end

    false
  end

  # Find index of a value
  def find(value)
    current_node = @head
    index = 0
    found = false
    until current_node.nil?
      if current_node.value == value
        found = true
        break
      end
      index += 1
      current_node = current_node.next_node
    end

    if found == true
      puts "Value is at index: #{index}"
    elsif puts 'Value does not exist in list'
    end
  end

  # Head:( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    list = ''
    current_node = @head

    list << "Head:( #{current_node.value} ) -> " unless @head.nil?

    until current_node.next_node.nil?
      current_node = current_node.next_node
      list << "( #{current_node.value} ) -> "
    end

    list << 'nil'

    puts list
  end
end

# Create new node object with input value and pointer
class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end

# Debug tests
linked_list = LinkedList.new
linked_list.append(2)
linked_list.append(4)
linked_list.append(6)
linked_list.prepend(1)
linked_list.to_s
linked_list.pop
linked_list.size
linked_list.head_value
linked_list.tail_value
linked_list.at(3)
puts linked_list.contains?(4)
puts linked_list.contains?(6)
linked_list.find(4)
linked_list.to_s
