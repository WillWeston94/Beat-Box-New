class BeatBox
    attr_accessor :list

    def initialize
        @list = LinkedList.new
    end
    

    def append(data)
        elements = data.split
        # require 'pry': binding.pry
        elements.each do |element|
            new_node = Node.new(element)
            @list.append(new_node.data)
        end
    end

    def count
        @list.count
    end

    
    def play
    beats = "tee dee deep bop boop la na"
    `say #{beats}`
    end
end



