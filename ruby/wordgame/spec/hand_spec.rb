require './spec_helper'

VOWELS = 'aeiou'
CONSONANTS = 'bcdfghjklmnpqrstvwxyz'
HAND_SIZE = 30

describe Hand do
	
	context "initialize" do
		
		it "should be pseudo random" do
			repeats = 0
			hand1 = Hand.new(HAND_SIZE)
			(0..20).each do |i|
				hand2 = Hand.new(HAND_SIZE)
				repeats += 1 if hand1.eql?(hand2)
				hand1 = hand2
			end
			repeats.should be < 10
		end
		
	end
		
	context ".update" do
		
		it "should reduce hand by given letters" do
			h = Hand.new(8, {'a' => 3, 'b' => 2, 'd' => 3})
			h.update('bad')
			h.containsLetters?('aabdd').should be_true
		end
		
	end
	
	context ".containsLetters?" do
		
		before(:each) do
			@h = Hand.new(8, {'a' => 3, 'b' => 2, 'd' => 3})
		end
	
		it "should return true" do 
			@h.containsLetters?('ab').should be_true		
		end
		
		it "should return false" do
			@h.containsLetters?('abe').should be_false
		end
	
	end
	
	context ".isEmpty?" do
	
		it "should return false" do 
			h = Hand.new(8, {'a' => 3, 'b' => 2, 'd' => 3})
			h.isEmpty?.should be_false		
		end
		
		it "should return true" do
			h = Hand.new(8, {'a' => 0, 'b' => 0, 'd' => 0})
			h.isEmpty?.should be_true
		end
	
	end
	
	context ".to_str" do
	
		it "should return string 'a a a b b d d d'" do
			h = Hand.new(8, {'a' => 3, 'b' => 2, 'd' => 3})
			h.to_str.should be == ("a a a b b d d d ")
	 	end
	
	end
	
end
