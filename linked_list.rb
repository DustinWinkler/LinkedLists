class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end

  # Add new node to end of list
  def append(value)
    node = Node.new(value)

    if @head.nil?
      @head = node
    elsif self.tail.nil?
      @head.next = node
    else
      self.tail.next = node
    end
  end

  # Add new node to start of list
  def prepend(value)
    node = Node.new(value)
    node.next = @head
    @head = node
  end

  # Return total number of nodes in list
  def size
    size = 0
    node = @head
    until node.nil?
      size += 1
      node = node.next
    end
    size
  end

  # Return last element in list
  def tail
    if @head.nil?
      return nil
    end

    node = @head
    until node.next.nil?
      node = node.next
    end
    return node
  end

  # Return node at given index
  def at(index)
    if index > self.size - 1 
      puts "The list is only goes up to index: #{self.size - 1}. We'll use the last element"
      index = self.size - 1
    elsif index == -1
      index = self.size - 2 # easy use for pop method
    end

    node = @head
    i = 0
    until i == index
      node = node.next
      i += 1
    end
    node
  end

  # Remove last element
  def pop
    self.at(-1).next = nil
  end

  # Return true if value exists in list, else false
  def contains?(value, index = 0)
    node = @head
    i = 0
    until node.value == value || i == self.size - 1
      node = node.next
      i += 1
    end

    if node.value == value
      index.zero? ? true : i
    else
      index.zero? ? false : nil
    end
  end
  # Returns index of node containing given value, if not found, nil
  def find(value)
    return self.contains?(value, 1)
  end

  # Insert node with given value at given index
  def insert_at(value, index)
    node = Node.new(value)
    node.next = self.at(index)
    self.at(index - 1).next = node
  end

  # Remove node at given index
  def remove_at(index)
    if index.zero?
      @head = @head.next
    else
      at(index - 1).next = at(index + 1)
    end
  end

  # Present list as strings in format: ( value ) -> ( value ) -> ( value ) etc.
  def to_s
    node = @head
    string = ""
    until node.nil?
      string.concat("( #{node.value} ) -> ")
      node = node.next
    end
    string
  end
end

class Node
  attr_accessor :value, :next
  
  def initialize(value = nil)
    @value = value
    @next = nil
  end

end

list = LinkedList.new
list.append('Tom')
list.append('Jimmy')
list.prepend('Brandon')
list.append('Sarah')
list.prepend('Jennifer')
p list
p list.at(3).value
p list.size
list.pop
p list
puts list.contains?('Jimmy')
puts list.contains?('Timmy')
puts list.find('Brandon')
list.insert_at('John', 2)
p list
list.remove_at(0)
p list
list.remove_at(1)
p list
puts list
