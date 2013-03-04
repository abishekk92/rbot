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



class Bot
	attr_accessor :input,:board,:word_objects

  def initialize
	@probability_table={}
	@board=Array.new(7){[0]*7}
	#@opponent_board[3][3],@current_position=1,24
	words=IO.read("words.dat").split("\n").select{|i| i.strip.length == 7 or i.strip.length == 4 or i.strip.length == 3}
	@word_objects=words.collect do |word|
		_word=Word.new word.strip
		_word.score=0.0
		word.split(//).each{|letter| _word.score+=probability_table[letter].to_f}
		_word
     	end 
	word_objects.sort_by!{|word| word.score}.reverse!
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

  def update_board(letter,position)
	@board[position/7][position%7]=letter
  end

  def mid_row(letter)
	word_objects.find{|word| word.middle_letter==letter}.word
  end 
  
  def pre_fill_board
	letter=@input.split(" ")[1]
	seed_word=mid_row(letter)
	word_split=seed_word.split(//)
	board.each_with_index{|array,index| array[3]=word_split[index]}
	board.map!{|array| mid_row(array[3],word_objects).split(//)}
  end 

  def pick_letter
    
  
  end 
  
  def pick_position(letter)
  
  end

  
end 
bot=Bot.new
input=bot.get_input
 
  def board_full(bot)
      bot.my_board.include? nil
  end 

  def play_offence(bot)
 	letter,position=bot.pick_letter
	bot.write_out([letter,position].join " ")
	opponent_position=bot.get_input
	letter=bot.get_input.split(" ").first
	position=bot.pick_position(letter)
	bot.write_out(position)
  end
  
  def play_defence(bot) 
	  letter=bot.get_input.split(" ").first
	  position=bot.pick_position(letter)
	  bot.write_out(position)
	  letter,position=bot.pick_letter
	  bot.write_out([letter,position].join " ")
	  opponent_position=bot.get_input
  end 

  if bot.is_first?
	play_offence(bot) until board_full(bot)
  else 
  	play_defence(bot) until board_full(bot)
  end 
