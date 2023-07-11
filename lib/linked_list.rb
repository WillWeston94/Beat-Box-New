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
    # data parameter represents our value we want to store in node
    # checks if head is nil to indicate if our list is empty
    # if our list is empty to start we create a new node based on data and it becomes our first node aka head 
    # if list is not empty we can assume there is a last node so we can hold a reference to our head node to traverse list and find last_node
    # create our while loop that iterates until next node is nil returned by our boolean
    # update our last_node variable. Move reference to traverse
    # create new node using next_node attribute from last_node and adds our new data stored inside of our node to the end of our list
    def append(data)
        if @head.nil?
            @head = Node.new(data, nil)
        else
            last_node = @head
            while(!last_node.next_node.nil?)
                last_node = last_node.next_node
            end
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

    # prepend method
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
    
    # insert method
    # index parameter represents position in list
    # create new node to be inserted
    # if no list exists our node is now inserted as head of list
    # if list exists current variable holds our head
    # current points to node that will come BEFORE our newly stored data node
    # node.next_node is set as current now points to following node in list
    # current is updated by next_node and we insert our new node into specified index position
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

    # find method
    # start parameter is position in list
    # num parameter is how many elements returned
    # if start less than 0 its invalid 
    # if num is less than or equal to 0 this is also an invalid return of elements
    # if nil? returns boolean true this also means list is empty
    def find(start_position, num_elements)
        return [] if start_position < 0 || num_elements <= 0 || @head.nil?
    # initilize array
    # current variable to hold head
    # count tracker set 
        result = []
        current = @head
        count = 0
    # loop iterates as long as current not returned nil
    # count is less than sum of start and num of elements returned
        while current && count < start_position + num_elements
    # << data appended to result if count is greater than or equal to start
          result << current.data if count >= start_position
    # update current to next by traversing list
    # tracker for nodes traversed
          current = current.next_node
          count += 1
        end
    # implicit return our elements based on position
        result
    end
    
    # include? method
    # value paramter to be checked for
    # will return false if list is empty by checking head
    # current variable holds reference to head
    # start loop if list is not empty
    # if value parameter matches our data stored in node it returns true
    # continue to traverse list with current.next_node
    # if no value matches and list is fully traversed we return false to indicate no match in list
    def includes?(value)
        return false if @head.nil?
        current = @head
            while current
            return true if current.data == value
            current = current.next_node
            end
        false
    end
    
    # pop method
    # check for empty list usign .nil?
    # if true no node to remove
    def pop
        if @head.nil?
            nil
        end
    # if list only contains head node there is no next_node
    # assigns applicable pop data to only existing head node
    # we then set head to nil since its been removed
    # return node removed through pop_data variable
        if @head.next_node.nil?
            pop_data = @head.data
            @head = nil
          return pop_data
        end
    # current set to head reference if our list contains more than head node
        current = @head
    # as long as we have a next node and the following node exists we can run our loop
    # traverse using current variable set through current checking for next_node
        while current.next_node && current.next_node.next_node
          current = current.next_node
        end
    # pop_data variable is assigned the data attribute of next/last node 
    # we then set 2nd to last node attribute to nil removing last node from list
    # inplicit return the removed/popped data of the last node
        pop_data = current.next_node.data
        current.next_node = nil
        pop_data
    end
    
end