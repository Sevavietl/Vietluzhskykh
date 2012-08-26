require './spec_helper'

describe ComputerPlayer do

	context ".pickBestWord" do 
	
		it "should be true" do
			wordlist = Wordlist.new(WORLD_URL)
			$points_dict = {}
			wordlist.wordlist.each { |word| $points_dict[word] = getWordScore(word) }
			$points_dict
			$rearrenge_dict = {}
			wordlist.wordlist.each { |word| $rearrenge_dict[word.chars.sort.join] = word }
			$rearrenge_dict
			p = ComputerPlayer.new(1, Hand.new(6, { 'c' => 1, 'a' => 1, 'b' => 1, 'd' => 1, 'o' => 1, 'e' => 1 }))
			getWordScore(p.pickBestWord).should eql(getWordScore('abode'))
		end
	
	end

end
