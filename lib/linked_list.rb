require "./lib/node"

class LinkedList
    attr_accessor :head

    def initialize
        @head = nil
    end

    # append adds new piece of data to the end of the linked list
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

    def count
         
        0 if @head
        node = @head
        counter = 0
        while node do
            node = node.next_node
            counter += 1
        end
        counter
    end

    def to_string
        current = @head
        elements = []
        while current
            elements << current.data
            current = current.next_node
        end
        elements.join(' ')
    end
end