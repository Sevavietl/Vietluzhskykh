require 'open-uri'

#
# A word list
#

class Wordlist

	attr_reader :wordlist

	#
	# Initializes a WordList object
	#
	def initialize(word_url)
		@wordlist = []
		open(word_url){|f|
			f.each_line{|word| @wordlist.push(word.strip.downcase)}
		}	
	end
	
	#
	# Test whether this worldlist includes word
	#
	# Returns: true if word in this list,
	#	   false if word is not.
	#
    	def containsWord?(word)
		@wordlist.include?(word)
	end
	
end
