probability_table={}
probability=IO.read("probabilities.txt")
probability.split("\n").each do |line|
		line_split=line.split(",")
		probability_table[line_split.first]=line_split[1]
	end 
class Word
	attr_accessor :word,:first_letter,:middle_letter,:score,:length

	def initialize(word)
		@word=word
		word_split=@word.split(//)
		@length,@first_letter,@middle_letter=word.length,word_split.first,word_split[word_split.length/2]	
	end
end 


words=IO.read("words.dat").split("\n").select{|i| i.strip.length == 7 or i.strip.length == 4 or i.strip.length == 3}
word_objects=words.collect do |word|
	_word=Word.new word.strip
	_word.score=0.0
	word.split(//).each{|letter| _word.score+=probability_table[letter].to_f}
	_word
end 
word_objects.sort_by!{|word| word.score}.reverse!
def mid_row(letter,word_objects)
	word_objects.find{|word| word.middle_letter==letter}.word
end 

print mid_row("T",word_objects)




