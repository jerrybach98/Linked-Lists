class LinkedList
  attr_accessor :tail, :head

  def initialize
    @head = nil
    @tail = nil
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

    # add to beginning
    # if empty else
    def prepend(value)
      if @head == nil
      @head = Node.new(value, nil)
      else 
        old_head = @head
        @head = Node.new(value, old_head)
      end
    end

  end

  
  def prepend(value)
    # if head head value to front
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
linked_list.append(3)
linked_list.append(4)
linked_list.prepend(1)


puts "h: #{linked_list.head.value}"
puts linked_list.head.next_node.value
puts linked_list.head.next_node.next_node.value
puts linked_list.head.next_node.next_node.next_node.value
puts "- nil"