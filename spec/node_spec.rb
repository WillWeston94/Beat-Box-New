require 'rspec'
require './lib/node'

RSpec.describe Node do
    it "#Class exists" do #pass
        node = Node.new("plop", nil)

        expect(node.data).to eq("plop")
    end

    it "#returns next_node nil" do
        node = Node.new("plop", nil)

        expect(node.next_node).to eq(nil)
    end

    it"# tail? returns true when next node is nil" do
        node = Node.new("plop", nil)

        expect(node.tail?).to be(true)
    end
    
end