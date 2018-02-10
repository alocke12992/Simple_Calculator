
# # TODO #
#


@current_total = 0.00
@symbol = ['+', '-', '*', '/', '%']
@regex = /^\d+(\.\d+)?$/
@modifier = ' '
@hist = []

# =========== Initial Menu =========== #

def initial_menu
  puts "What is the first number?"
    user_input = gets.strip
  if user_input.match(@regex)
    @current_total = user_input.to_f
    @hist << @current_total
    selection_menu
  else
    puts "Error. Please put a number"
  end
end

# =========== Selection Menu =========== #

def selection_menu
  puts 'What would you like to do?'
  puts '1) Add a modifier'
  puts '2) Clear'
  puts '3) Calculate'
  puts '4) Exit Calculator'
  user_input = gets.strip.to_i

  case user_input
  when 1
    add_modifier
  when 2
    clear
  when 3
    calculate
  when 4
    puts "Exiting calculator"
    exit
  else
    puts "Error. Please choose an option."
    selection_menu
  end
end

# =========== LIST HISTORY =========== #

def list_hist
  print "> "
  @hist.each{|x| "#{x} "}
end

# =========== Add Mod =========== #

def add_modifier
    list_hist
    puts
    puts "Please choose a modifier"

    sym_mod = @symbol.clone
    puts sym_mod.join(" ")
      mod = gets.strip
  if @symbol.include?(mod)
      @modifier = mod.to_sym
      @hist << @modifier
      next_num
  else
    puts "Invalid. Please try again"
    add_modifier
  end
end

# =========== Next Num =========== #

def next_num
    list_hist
    puts
    puts 'What is your next number?'
    user_input  = gets.strip
  if user_input.match(@regex)
    num = user_input.to_f
    @hist << num

  else
    puts 'invalid entry'
    next_num
  end
    @current_total = @current_total.send(@modifier, num)
    calculate
    selection_menu
end

# =========== CALCULATE TOTAL =========== #

def calculate
  puts "#{list_hist} = #{@current_total}"
  selection_menu
end

# =========== CLEAR CALC =========== #

def clear
  @current_total = 0.00
  @hist.clear
  puts "The calculator has been cleared"
  initial_menu
end




  initial_menu
