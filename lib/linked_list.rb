require "./lib/node"
# above file is required by our linkedlist class


class LinkedList
    # declares head attribute allowing read and modify
    attr_accessor :head

    # head assigned to nil
    # represents first node in list
    # generates empty list
    def initialize
        @head = nil
    end

    # append adds new piece of data to the end of the linked list
    # data parameter represents our value stored in node 
    def append(data)
    # checks if head is nil to indicate if our list is empty
        if @head.nil?
    # if our list is empty to start we create a new node based on data and it becomes our first node aka head 
            @head = Node.new(data, nil)
        else
    # if list is not empty we cann assume there is a last node so we can hold a reference to our head node to traverse list and find last_node
            last_node = @head
    # create our loop that iterates until next node is nil returned by our boolean
            while(!last_node.next_node.nil?)
    # update our last_node variable. Move reference to traverse
                last_node = last_node.next_node
            end
    # create new node using next_node attribute of line 29 last_node and adds our new data stored inside of our node to the end of our list
            last_node.next_node = Node.new(data, nil)
        end
    end

    # count method
    # initialize node to reference head
    # counter to keep track set to 0
    # start loop if node is not nil
    # line 47 update node variable to next node in our list to traverse
    # counter increments our nodes traversed
    # implicit return value of nodes traversed
    def count
        node = @head
        counter = 0
        while node do
            node = node.next_node
            counter += 1
        end
        counter
    end

    # string method
    # current variable to hold reference for our head
    # initialize empty array
    # line 63 loop iterates as long as current is not nil
    # << operator to append data to array
    # continue to traverse list with current variable by using our next_node
    # implicit return our joined data stored in nodes using space limiter '
    def to_string
        current = @head
        elements = []
        while current
            elements << current.data
            current = current.next_node
        end
        elements.join(' ')
    end

    # data as our passed parameter to keep consistency 
    # checks if list is empty
    # if returned true we create new node using data parameter passed in
    # line 80 creates our current node if list already exists
    # have our current node point to previous node
    # that current node now becomes head node since its added before previous head
    def prepend(data)
        if @head.nil?
            @head = Node.new(data)
        else
            current = Node.new(data)
            current.next_node = @head
            @head = current
        end
    end
    
    
    def insert(index, data)
        node = Node.new(data)
        if index == 0
            node.next_node = @head
            @head = node
        else 
            current = @head
            (index - 1).times{current = current.next_node}
            node.next_node = current.next_node
            current.next_node = node
        end
    end

    def find(start_position, num_elements)
        return [] if start_position < 0 || num_elements <= 0 || @head.nil?
      
        result = []
        current = @head
        count = 0
      
        while current && count < start_position + num_elements
          result << current.data if count >= start_position
          current = current.next_node
          count += 1
        end
      
        result
    end
    
    def includes?(element)
        return false if @head.nil?
      
        current = @head
      
        while current
          return true if current.data == element
          current = current.next_node
        end
      
        false
      end
      
      def pop
        if @head.nil?
            nil
        end

        if @head.next_node.nil?
          pop_data = @head.data
          @head = nil
          return pop_data
        end
      
        current = @head
      
        while current.next_node && current.next_node.next_node
          current = current.next_node
        end
      
        pop_data = current.next_node.data
        current.next_node = nil
        pop_data
      end
      
end