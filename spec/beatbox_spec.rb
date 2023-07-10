require 'rspec'
require 'pry'
require "./lib/beat_box"
require "./lib/linked_list"
require "./lib/node"

RSpec.describe BeatBox do
    it "#BeatBox class exists" do #pass
        bb = BeatBox.new

        expect(bb).to be_an_instance_of(BeatBox)
    end

    it "#list exists" do
        bb = BeatBox.new

        bb.list
        expect(bb.list.head).to eq(nil)
    end
end