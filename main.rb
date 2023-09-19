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


puts "h: #{linked_list.head.value}"
puts linked_list.head.next_node.value
puts linked_list.head.next_node.next_node.value
puts linked_list.head.next_node.next_node.next_node.value
puts "- nil"

linked_list.pop
linked_list.size
linked_list.head_value
linked_list.tail_value
linked_list.at(3)