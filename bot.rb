$alphabets=('A'..'Z').to_a
$indexes=(0..48).to_a

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

"bot=Bot.new
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
end"




