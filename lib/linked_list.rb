require "./lib/node"

class LinkedList
    attr_accessor :head

    def intialize
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
end