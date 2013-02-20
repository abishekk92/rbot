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
list=IO.read("words.dat").split("\n").collect{|word| SuffixArray.new word.strip}
=begin
result=list.collect do |suffix| 
	position=suffix.find_substring("AA")
	position unless position.nil?
end 
=end
print list[500].print_suffix_array

