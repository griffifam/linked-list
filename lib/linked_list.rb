# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node = nil)
    @data = value
    @next = next_node
  end
end

# Defines the singly linked list
class LinkedList
  def initialize
    @head = nil # keep the head private. Not accessible outside this class
  end

  # method to add a new node with the specific data value in the linked list
  # insert the new node at the beginning of the linked list
  # Time Complexity: O(1)
  # Space Complexity O(1)
  def add_first(value)
    new_node = Node.new(value)

    if @head == nil
      @head = new_node
    else
      current = @head
      new_node.next = current
      @head = new_node
    end
  end

  # Additional Exercises
  # returns the value in the first node
  # returns nil if the list is empty
  # Time Complexity: O(1)
  # Space Complexity: O(1)
  def get_first
    if @head == nil
      return nil
    end

    current = @head
    return current.data
  end

  # method to find if the linked list contains a node with specified value
  # returns true if found, false otherwise
  # Time Complexity: O(n)
  # Space Complexity O(1)
  def search(value)
    if @head.nil?
      return false
    end

    current = @head
    while current.next != nil
      if current.data == value
        return true
      end
      current = current.next
    end

    return false
  end

  # method to return the max value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: o(1)
  def find_max
    if @head == nil
      return nil
    end

    max_value = 0

    current = @head
    while current != nil
      if current.data > max_value
        max_value = current.data
      end

      current = current.next
    end

    return max_value
  end

  # method to return the min value in the linked list
  # returns the data value and not the node
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_min
    if @head == nil
      return nil
    end

    min_value = 10000000

    current = @head
    while current != nil
      if current.data < min_value
        min_value = current.data
      end

      current = current.next
    end

    return min_value
  end


  # method that returns the length of the singly linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def length
    if @head == nil
      return 0
    end

    length = 0

    current = @head
    while current != nil
      current = current.next
      length += 1
    end

    return length
  end

  # method that returns the value at a given index in the linked list
  # index count starts at 0
  # returns nil if there are fewer nodes in the linked list than the index value
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_at_index(index)
    if @head == nil
      return nil
    end

    current = @head
    idx = 0

    while idx < index
      current = current.next
      idx += 1
    end

    return current.data
  end

  # method to print all the values in the linked list
  # Time Complexity: O(n)
  # Space Complexity O(1)
  def visit
    if @head.nil?
      return
    end

    current = @head
    while current.next != nil
      print current.data
      current = current.next
    end
  end

  # method to delete the first node found with specified value
  # Time Complexity: O(n)
  # Space Complexity O(1)
  def delete(value)
    if @head.nil?
      return
    end

    current = @head
    if current.data == value
      @head = current.next
      return
    end

    while current.next != nil
      if current.next.data == value
        node_to_delete = current.next
        current.next = node_to_delete.next
        return
      end

      current = current.next
    end
  end

  # method to reverse the singly linked list
  # note: the nodes should be moved and not just the values in the nodes
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def reverse
    if @head == nil
      return
    end

    current = @head
    prev_node = nil

    while current != nil
      next_node = current.next
      current.next = prev_node

      prev_node = current
      current = next_node
    end

    @head = prev_node
  end


  ## Advanced Exercises
  # returns the value at the middle element in the singly linked list
  # Time Complexity:
  # Space Complexity
  def find_middle_value
    if @head.nil?
      return
    end

    slow = @head
    fast = slow

    while fast

    end
  end

  # find the nth node from the end and return its value
  # assume indexing starts at 0 while counting to n
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def find_nth_from_end(n)
    if @head == nil
      return
    end

    if n >= self.length
      return nil
    end

    distance = 0
    slower = @head
    faster = slower

    while distance < n
      faster = faster.next
      distance += 1
    end

    while faster.next != nil
      slower = slower.next
      faster = faster.next
    end

    return slower.data
  end

  # checks if the linked list has a cycle. A cycle exists if any node in the
  # linked list links to a node already visited.
  # returns true if a cycle is found, false otherwise.
  # Time Complexity: O(n)
  # Space Complexity O(1)
  def has_cycle
    if @head.nil?
      return false
    end

    slower = @head
    faster = slower.next

    while slower != nil
      if faster == slower
        return true
      end
      slower = slower.next
      faster = faster.next

      if faster != nil
        faster = faster.next
      end
    end

    return false
  end

  # method that inserts a given value as a new last node in the linked list
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def add_last(value)
    new_last_node = Node.new(value)

    if @head == nil
      @head = new_last_node
      return
    end

    current = @head
    while current.next != nil
      current = current.next
    end

    current.next = new_last_node
  end

  # method that returns the value of the last node in the linked list
  # returns nil if the linked list is empty
  # Time Complexity: O(n)
  # Space Complexity: O(1)
  def get_last
    if @head == nil
      return nil
    end

    current = @head
    while current.next != nil
      current = current.next
    end

    return current.data
  end

  # method to insert a new node with specific data value, assuming the linked
  # list is sorted in ascending order
  # Time Complexity: O(n)
  # Space Complexity O(1)
  def insert_ascending(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
      return
    end

    current = @head
    while (current.next != nil) || (new_node.data < current.next.data)
      current = current.next
    end

    if current.next != nil
      new_node.next = current.next
    end

    current.next = new_node
  end

  # Helper method for tests
  # Creates a cycle in the linked list for testing purposes
  # Assumes the linked list has at least one node
  def create_cycle
    return if @head == nil # don't do anything if the linked list is empty

    # navigate to last node
    current = @head
    while current != nil
      current = current.next
    end

    current.next = @head # make the last node link to first node
  end

end