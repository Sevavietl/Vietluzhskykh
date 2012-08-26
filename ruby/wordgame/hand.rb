#
# A class representation of a hand
#
class Hand

	attr :handDict
	
	#
	# Initialize a hand.
	# handSize: The size of the hand
	# postcondition: initializes a hand with random set of initial letters.
	#
	def initialize(handSize, initialHandDict = nil)
		num_vowels = handSize / 3
		if initialHandDict == nil then
			initialHandDict = {}
			initialHandDict.default = 0
			(0...num_vowels).each do |i|
				x = VOWELS[Random.rand(VOWELS.size)]
				initialHandDict[x] = initialHandDict[x] + 1
			end
			(num_vowels...handSize).each do |i|
				x = CONSONANTS[Random.rand(CONSONANTS.size)]
				initialHandDict[x] = initialHandDict[x] + 1
			end		
		end
		@initialSize = handSize
		@handDict = initialHandDict
		@handDict.default = 0
	end
	
	#
	# Remove letters in the word from this hand.
	# word: The word (a string) to remove from the hand.
	# postcondition: Letters in the word are removed from the hand.
	#
	def update(word)
		word.each_char { |letter| @handDict[letter] = @handDict[letter] - 1 }
	end
	
	#
	# Test if this hand contains the characters required to male the input string (letters)
	#
	# returns: True if the hand contains the charactrs to make up letters, False otherwise
	#
	def containsLetters?(letters)
		wordDict = {}
		wordDict.default = 0
		letters.each_char { |letter| wordDict[letter] = wordDict[letter] + 1}

		wordDict.each { |key, value| return false if @handDict[key] < value }
		true
	end
	
	#
	# Test if there are any more letters left in this hand.
	#
	# return True if there are no letters remaining, False otherwise.
	#
	def isEmpty?
		@handDict.each { |key, value| return false if value != 0 }
		true
	end
	
	#
	# Equality test, for testing purposes 
	#
	# returns: True if this Hand contains the same number of each letter as 
	# the other Hand, False otherwise.
	#
	def eql?(other)
		raise TypeError unless other.class.name == "Hand"
		return false if self.handDict.size != other.handDict.size
		@handDict.each { |letter| if @handDict[letter] != other.handDict[letter] then return false end}
		true
	end
	
	#
	# Represents this hand as a string.
	#
	# returns: a string representation of this hand.
	#
	def to_str
		string = ""
		@handDict.each do |key, value|
		      	while value > 0 do
		      		string += key + " "
		      		value -= 1
	      		end  
      		end
		string      		
	end
	
end
