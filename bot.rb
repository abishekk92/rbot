$alphabets=('A'..'Z').to_a
$indexes=(0..48).to_a

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
board=Array.new(7){[0]*7}
letter=gets.strip
board[3][3]=letter
seed_word=mid_row(letter,word_objects)
word_split=seed_word.split(//)
board.each_with_index{|array,index| array[3]=word_split[index]}
board.map!{|array| mid_row(array[3],word_objects).split(//)}
board.each{|row| puts row.join " "}


class Bot
	attr_accessor :input,:my_board,:opponent_board,:current_position

  def initialize
	@probability_table={}
	@my_board=Array.new(7){Array.new(7)}
	#@opponent_board[3][3],@current_position=1,24
  end

  def get_input
	@input=gets.strip
  end

  def is_first?
	split=@input.split(" ")
	split.length > 1 and split.first=='1'
  end 

  def write_out(to_write)
	print to_write 
	STDOUT.flush
  end 

  def update_board(letter,position,board)
	board[position/7][position%7]=letter
  end

  def fill_board
  end 

  def calculate_letter(position)
    #$alphabets.sample 
	#sorted_list=filled_indexes.sort_by{|i| i[:count]}
	 i,j=position/7,position%7
	 sub_string=@my_board[i].join
  def calculate_position
	# i,j=@current_position/7,@current_position%7
	# if  i==7 and j==7
	 
	# else
	# 	i,j=i+1,j+1
	# end 
	position=$indexes.sample
	$indexes.delete(position)
	position
  end

  def print_probability_table
 	
	print @probability_table
  end 
  def self.print_alphabets
	print $alphabets
  end

end
end 
bot=Bot.new
input=bot.get_input
  def board_full(bot)
      bot.my_board.include? nil
  end 
  def play(bot)
        puts board_full(bot)
	until board_full(bot)
		position=bot.get_input
		letter=bot.calculate_letter(position)
		bot.update_board(letter,position,bot.my_board)
		output_position=bot.calculate_position
		bot.write_out(output_position)
      end 
  end 
  if bot.is_first?
	bot.update_board(input.split(" ")[1],24,bot.my_board)
	position=bot.calculate_position
	bot.write_out(position)
	play(bot)
  else 
	play(bot)
end
