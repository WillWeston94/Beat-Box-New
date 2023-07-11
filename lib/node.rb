class Node # represents node in linked list data structure 
    # accessor provides getter and setter methods for data, and next_node
    # allowing to read and modify values outside of their class
    attr_accessor :data,
                  :next_node

    # data parameter represents value stored in the node
    # next_node parameter represents next node in list
    # next_node by default set to nil
    # @data + @next_node assign values passed to initialize to instance variables to store our data
    def initialize(data,next_node = nil)
        @data = data
        @next_node = next_node
    end

    # tail? returns boolean value 
    # checks if current_node is our tail by checking next
    # returns true if node = tail
    # returns false if not
    def tail?
        next_node.nil?
    end
end
