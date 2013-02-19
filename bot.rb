$alphabets=('A'..'Z').to_a
$indexes=[0..48].to_a.delete(24)
class Bot
	attr_accessor :input,:probability_table,:my_board,:opponent_board,:current_position

def initialize
	probability=IO.read("probabilities.txt")
	@probability_table={}
	@my_board=Array.new(7){Array.new(7)}
	#@opponent_board[3][3],@current_position=1,24
	probability.split("\n").each do |line|
		line_split=line.split(",")
		@probability_table[line_split.first]=line_split[1]
	end     
end
def get_input
	@input=gets
end

def is_first?
	split=@input.split(" ")
	split.length > 1 and split.first=='1'
end 

def write_out(to_write)
	print to_write 
end 

def update_board(letter,position,board)
	board[position/7][position%7]=letter
end

def calculate_letter(position)
    $alphabets.sample 
end

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

class SuffixArray
  def initialize(the_string)
    @the_string = the_string
    @suffix_array = Array.new
    last_index = the_string.length-1
    (0..last_index).each do |i|
      the_suffix = the_string[i..last_index]
      the_position = i
      @suffix_array << { :suffix=>the_suffix, :position=>the_position }
    end
    @suffix_array.sort! { |a,b| a[:suffix] <=> b[:suffix] }
  end
    
  def find_substring(the_substring)
    high = @suffix_array.length - 1
    low = 0
    while(low <= high)
      mid = (high + low) / 2
      this_suffix = @suffix_array[mid][:suffix]
      compare_len = the_substring.length-1
      comparison = this_suffix[0..compare_len]
      if   comparison > the_substring
        high = mid - 1
      elsif comparison < the_substring
        low = mid + 1
      else 
        return @suffix_array[mid][:position]
      end
    end
    return nil
  end
  def print_suffix_array
	  print @suffix_array
  end 
end
bot=Bot.new
input=bot.get_input
def board_full
	bot.my_board.include? nil
end 
def play(bot)
	until board_full
		position=bot.get_input
		letter=bot.calculate_letter(position)
		bot.update_board(letter,position,bot.my_board)
		bot.calculate_position
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


