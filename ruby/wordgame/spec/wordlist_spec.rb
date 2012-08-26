require './spec_helper'

WORLD_URL = "http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-00-introduction-to-computer-science-and-programming-fall-2008/assignments/words.txt"

describe Wordlist do

	context ".containsWord?" do
	
		before(:each) do
			@wordlist = Wordlist.new(WORLD_URL)
		end

		it "should contain given word" do
			@wordlist.containsWord?("aahed").should be_true
		end

		it "should not contain given word" do
			@wordlist.containsWord?("bcdfghj").should be_false
		end


	end
	
end
