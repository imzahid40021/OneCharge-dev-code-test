# Definition for a singly-linked list node
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# Function to return the middle node of the linked list
def middle_node(head)
  slow = head
  fast = head

  # Move 'fast' two steps and 'slow' one step at a time
  while fast && fast.next
    slow = slow.next
    fast = fast.next.next
  end

  # Return the slow pointer, which now points to the middle node
  slow
end

# Helper function to create a linked list from an array
def create_linked_list(arr)
  return nil if arr.empty?

  head = ListNode.new(arr[0])
  current = head

  arr[1..-1].each do |val|
    current.next = ListNode.new(val)
    current = current.next
  end

  head
end

# Helper function to print the linked list from a given node
def print_linked_list(node)
  result = []
  while node
    result << node.val
    node = node.next
  end
  puts result.inspect
end

# Test case 1: Odd number of nodes
puts "Test case 1: [1, 2, 3, 4, 5]"
arr1 = [1, 2, 3, 4, 5]
head1 = create_linked_list(arr1)
middle1 = middle_node(head1)
print_linked_list(middle1)  # Expected output: [3, 4, 5]

# Test case 2: Even number of nodes
puts "Test case 2: [1, 2, 3, 4, 5, 6]"
arr2 = [1, 2, 3, 4, 5, 6]
head2 = create_linked_list(arr2)
middle2 = middle_node(head2)
print_linked_list(middle2)  # Expected output: [4, 5, 6]
