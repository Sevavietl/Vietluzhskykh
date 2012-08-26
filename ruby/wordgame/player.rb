#
# General class representing a player.
# Stores the player's ID number, hand, and score.
#
class Player
	
	attr_reader :points, :idNum, :hand 
	
	#
	# Initialize a player instance.
	# idNum: integer:  1 for player 1, 2 for player 2.
	# hand: An object of type Hand.
	# postcondition: This player object is initialized.
	#
	def initialize(idNum, hand)
		raise TypeError if idNum.class != Fixnum
		raise TypeError if hand.class != Hand
		@points = 0
		@idNum = idNum
		@hand = hand
	end
	
	#
	# Add points to this player's total score.
	# points: the number of points to add to this player's score.
	# postcondition: this player's total score is increased by the points.
	#
	def addPoints(points) 
		@points += points
	end

	#
	# Compare players by their scores.
	# returns: 1 if this player's score is greater than other player's score,
	# -1 if this player's score is less than other player's score, and 0 if 
	# they're equal. 
	#
	def eql(other)
		raise TypeError if other.class != Player
		return 1 if self.points > other.points
		return -1 if self.points < other.points
		return 0 if self.points == other.points
	end
	
	#
	# Represent this player as a string.
	# returns: a string represntation of this player.
	#
	def to_str
		'Player %d\n\nScore: %.2f\n' % [self.idNum, self.points]
	end

end
