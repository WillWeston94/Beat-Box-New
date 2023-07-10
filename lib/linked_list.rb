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
end