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