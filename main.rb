class LinkedList
  attr_accessor :tail, :head

  def initialize
    @head = nil
    @tail = nil
    @list_size = 0
  end


  # head is nil at the end, append new Node object with a value and point to nil
  # on third append iterate through by setting current node to head
  def append(value)
    if @head == nil
      @head = Node.new(value, nil)
    else 
      current_node = @head 
      while current_node.next_node != nil
        current_node = current_node.next_node
      end
      # at end of list
      current_node.next_node = Node.new(value, nil)
    end
  end

  # add to beginning
  # set a new head and next value to old head
  def prepend(value)
    if @head == nil
    @head = Node.new(value, nil)
    else 
      old_head = @head
      @head = Node.new(value, old_head)
    end
  end
 
  # iterate through nodes and count
  def size()
    current_node = @head 
      while current_node do
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
    while current_node.next_node != nil
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
    
    if current_node == nil
      puts "Node does not exist at index #{index}"
    else
    puts "Node at index #{index}: #{current_node.value}"
    end
  end 

  # end, if next node = nil, set value to nil?
  # point previous value to tail
  def pop
    current_node = @head
    while current_node.next_node != nil
      previous_node = current_node
      current_node = current_node.next_node
    end
    puts "Last node removed: #{current_node.value}"
    previous_node.next_node = nil
  end 

  #contains?(value)

  def contains?(value)
    current_node = @head
    while current_node != nil
      if current_node.value == value
        return true
      end
      current_node = current_node.next_node
    end

    false
  end

  def find(value)
    current_node = @head
    index = 0
    found = false
    while current_node != nil
      if current_node.value == value
        found = true
        break
      end
      index += 1
      current_node = current_node.next_node
    end

    if found == true
      puts "Value is at index: #{index}"
    elsif 
      puts "Value does not exist in list"
    end
  end

  # Head:( value ) -> ( value ) -> ( value ) -> nil
  # conatenate to a string or array/if array flatten
  # first value head, 
  def to_s
    list = ""
    current_node = @head

    if @head != nil
      list << "Head:( #{current_node.value} ) -> " 
    end

    while current_node.next_node != nil
      current_node = current_node.next_node
      list << "( #{current_node.value} ) -> "
    end

    list << "nil"

    puts list
  end

end

class Node
  attr_accessor :value, :next_node

  # new node objects intialize value and pointer 
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

end


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