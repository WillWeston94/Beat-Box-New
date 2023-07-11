class BeatBox
    # accessor allows read and modify for list attribute outside of class
    attr_accessor :list

    # initialize variable list to hold instances of LinkedList
    def initialize
        @list = LinkedList.new
    end

    # append method continue to use parameter consistency for data stored IN nodes
    # split data and assign to elements variable
    # iterate of elements collection
    # singular set to element
    # create new_node instance using element as the data stored inside node
    # we append the data stored inside of our node to the list attribute initialized above
    # effectively allowing mutliple strings to be appeneded at once
    def append(data)
        elements = data.split
        # require 'pry': binding.pry
        elements.each do |element|
            new_node = Node.new(element)
            @list.append(new_node.data)
        end
    end

    # count method within BeatBox class
    # calls count method in LinkedList stored in @list attribute
    # implicit return result
    def count
        @list.count
    end

    # play method
    # assigns head to the stored linked list in @list attribute 
    # beats is then assigned variable
    # as long as we have a list we now retrieve data stored in nodes
    # say command to to execute audible output of beats aka data stored
    # beats = beats.next is neccessary or else an infinite loop occurs over the head node
    def play
        beats = list.head

        while beats
        beat = beats.data
        `say #{beat}`
        beats = beats.next_node
        end
    end

    
end



