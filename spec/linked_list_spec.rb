require 'rspec'
require 'pry'
require "./lib/linked_list"
require "./lib/node"

RSpec.describe LinkedList do
    it "#LinkedList class exists" do #pass
        list = LinkedList.new

        expect(list).to be_an_instance_of(LinkedList)
    end

   it "#head returns nil" do #pass
        list = LinkedList.new

        expect(list.head).to eq(nil)
    end

    it "#appends data doop" do #pass
        list = LinkedList.new

        list.append("doop")
        expect(list.head.data).to eq("doop")
    end

    it "#appends data doop,deep" do #pass
        list = LinkedList.new

        list.append("doop")
        list.append("deep")
        expect(list.head.next_node.data).to eq("deep")
    end

    it "#counts elements from Linked list" do #pass
        list = LinkedList.new

        list.append("doop")
        expect(list.count).to eq(1)
    end

    it "#generates string of elements in the Linked list" do #pry pass
        list = LinkedList.new

        list.append("doop")
        list.append("deep")
        expect(list.to_string).to eq("doop deep")
    end

    # xit "# prepends nodes to the beginning of the list" do #pry pass
    #     list = LinkedList.new

        
    #     list.append("plop")
    #     list.append("suu")
    #     list.prepend("dop")
    #     expect(list.head.data).to eq("dop plop suu")
    # end

    it "#generates string of elements in the Linked list" do #pry pass
        list = LinkedList.new

        
        list.append("plop")
        list.append("suu")
        list.prepend("dop")
        expect(list.to_string).to eq("dop plop suu")
    end
end