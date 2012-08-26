# Global Constants
VOWELS = 'aeiou'
CONSONANTS = 'bcdfghjklmnpqrstvwxyz'
HAND_SIZE = 10
SCRABBLE_LETTER_VALUES = {
    'a' => 1, 'b' => 3, 'c' => 3, 'd' => 2, 'e' => 1, 'f' => 4, 'g' => 2, 'h' => 4, 'i' => 1,
    'j' => 8, 'k' => 5, 'l' => 1, 'm' => 3, 'n' => 1, 'o' => 1, 'p' => 3, 'q' => 10, 'r' => 1,
    's' => 1, 't' => 1, 'u' => 1, 'v' => 4, 'w' => 4, 'x' => 8, 'y' => 4, 'z' => 10
}
HUMAN_SOLO = 0
HUMAN_VS_HUMAN = 1
HUMAN_VS_COMP = 2

WORLD_URL = "http://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-00-introduction-to-computer-science-and-programming-fall-2008/assignments/words.txt"

#
# Given a sequebce of letters , convert the sequence to a dictionary of letters -> frequencies. Used by containLetters?()
#
# returns: dictionary of letters -> frequencies
#
def getFrequencyDict(sequence)
	freq = {}
	freq.default = 0
	sequence.each_char { |letter| freq[letter] += 1 }
	freq
end

#
# Computes the score of a word (no bingo bonus is added).
# 
# word: The word to score (a string).
#
# returns: score of the word.
#
def getWordScore(word)
	score = 0
	word.each_char { |char| score += SCRABBLE_LETTER_VALUES[char] }
	score += 50 if word.size == HAND_SIZE
	score
end
