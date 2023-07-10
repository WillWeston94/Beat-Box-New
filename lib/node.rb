class Node
    # allows us to get and set data, and next_node 
    attr_accessor :data,
                  :next_node

    def initialize(data,next_node)
        @data = data
        @next_node = next_node
    end
end