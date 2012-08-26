#
# A computer player class.
# Does everything a Player class does,
# but can also pick a word using the 
# pickBestWord() method.
#
class ComputerPlayer < Player
	
	#
	# Pick the best word available to the computer player.
	#
	# returns: The best word (a string), given the computer player's hand and
	# the wordlist.
	#
	def pickBestWord
		hand = @hand.to_str.gsub(/\s+/, "").chars.sort
		best_score = 0
		best_word = "."
		(1..hand.size).each do |i|
			hand.combination(i).each do |combination|
				if $rearrenge_dict.has_key?(combination.join) then
					word = $rearrenge_dict[combination.join]
				else
					next
				end
				best_word, best_score = word, $points_dict[word] if $points_dict[word] > best_score
			end
		end
		best_word	
	end
	
	#
	# Play a hand completely by passing chosen words to the callback function.
	#
	def playHand
		total_score = 0
		i = 0
		puts @hand.to_str
		puts @hand.isEmpty?
		while not @hand.isEmpty? do
			puts 'Current Hand: %s' % [@hand.to_str]
			word = self.pickBestWord
			return if word == "."
			points = getWordScore(word)
			total_score += points
			puts '%s earned %d points. Total: %d points' % [word, points, total_score]
			@hand.update(word)
			i += 1
		end
	end
end
