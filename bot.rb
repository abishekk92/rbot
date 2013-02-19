class Bot
	attr_accessor :input,:probability_table,:my_board,:opponent_board

def initialize
	probability=IO.read("probabilities.txt")
	@probability_table={}
	@my_board=@opponent_board=Array.new(7){Array.new(7)}
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
	board[position]=letter
end

def calculate_letter

end

def calculate_position

end

def print_probability_table
 	
	print @probability_table
end 

end

class SuffixArray
  def initialize(the_string)
    @the_string = the_string
    @suffix_array = Array.new
    #build the suffixes 
    last_index = the_string.length-1
    (0..last_index).each do |i|
      the_suffix = the_string[i..last_index]
      the_position = i
      @suffix_array << { :suffix=>the_suffix, :position=>the_position }
    end
      
    #sort the suffix array
    @suffix_array.sort! { |a,b| a[:suffix] <=> b[:suffix] }
  end
    
  def find_substring(the_substring)
    #uses typical binary search
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
  
sa = SuffixArray.new("ADEEL")
sa.print_suffix_array
#puts sa.find_substring("ac") 
