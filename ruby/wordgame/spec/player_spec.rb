require './spec_helper'

describe Player do
	context "initialize" do
	
		before(:each) do
			@p = Player.new(1, Hand.new(6, {'c' => 1, 'a' => 1, 'b' => 1, 'd' => 1, 'o' => 1, 'e' => 1}))
		end
		
		it "should create an instance of Player class" do
			@p.class.should eql(Player)
		end
		
		it "should set points to zero" do
			@p.points.should eql(0)
		end
		
		it "should have an Hand instance as a variable hand" do
			h = Hand.new(6, {'c' => 1, 'a' => 1, 'b' => 1, 'd' => 1, 'o' => 1, 'e' => 1})
			@p.hand.eql?(h).should be_true
		end	
		
	end
	
	context ".addPoints" do
		
		it "should add points to the players score" do
			p = Player.new(1, Hand.new(6, {'c' => 1, 'a' => 1, 'b' => 1, 'd' => 1, 'o' => 1, 'e' => 1}))
			p.addPoints(6)
			p.points.should eql(6)
		end	
		
	end
	
	context ".eql" do
	
		before(:each) do
			@p1 = Player.new(1, Hand.new(6, {'c' => 1, 'a' => 1, 'b' => 1, 'd' => 1, 'o' => 1, 'e' => 1}))
			@p2 = Player.new(2, Hand.new(6, {'c' => 1, 'a' => 1, 'b' => 1, 'd' => 1, 'o' => 1, 'e' => 1}))
		end
		
		it "should return 1" do
			@p1.addPoints(7)
			@p2.addPoints(6)
			@p1.eql(@p2).should eql(1)	
		end		
		
		it "should return -1" do 
			@p1.addPoints(6)
			@p2.addPoints(7)
			@p1.eql(@p2).should eql(-1)	
		end
		
		it "should return 0" do
			@p1.addPoints(7)
			@p2.addPoints(7)
			@p1.eql(@p2).should eql(0)	
		end
			
	end
	
	context ".to_str" do
		
		it "should return string instance" do
			p = Player.new(1, Hand.new(6, {'c' => 1, 'a' => 1, 'b' => 1, 'd' => 1, 'o' => 1, 'e' => 1}))
			p.to_str.class.should eql(String)
		end
		
		it "should return 'Player 1\n\nScore: 0.00\n'" do 
			p = Player.new(1, Hand.new(6, {'c' => 1, 'a' => 1, 'b' => 1, 'd' => 1, 'o' => 1, 'e' => 1}))
			p.to_str.should eql('Player 1\n\nScore: 0.00\n')
		end
		
	end
	
end
