require_relative ('./lib/knight')

def knight_moves(start, target)
  knight = Knight.new
  path = knight.search(start, target)
  
  unless path.nil? 
    puts "You made it in #{path.length - 1} moves! Here's your path:"
    path.each {|square| p square} 
  else
    puts "You must have input a square that doesn't exist."
  end

end

knight_moves([0,0], [7, 7])