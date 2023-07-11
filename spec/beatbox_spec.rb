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

    it "#splits the appended elements" do
        bb = BeatBox.new

        bb.append("deep doo ditt")
        expect(bb.list.to_string).to eq("deep doo ditt")
    end

    it "#plays sounds" do #pry pass 
        bb = BeatBox.new

        bb.append("deep doo ditt woo hoo shu")
        bb.play

        expect(bb.play).to eq(nil)
    end

end