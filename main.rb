raise ArgumentError, "wrong number of arguments (#{ARGV.length} for 4)" unless ARGV.length == 4
ARGV.each{ |a| raise TypeError, 'you should input only positive numbers' unless a.to_i > 0}

coord_real = [ARGV[0].to_i, ARGV[1].to_i]
coord_find = [ARGV[2].to_i, ARGV[3].to_i]

def compare_coordinates(first_coordinates, second_coordinates)
  if first_coordinates == second_coordinates
    puts 'Точка найдена!'
  elsif first_coordinates[1] == second_coordinates[1]
    puts 'Y координата верна, X нет'
  elsif first_coordinates[0] == second_coordinates[0]
    puts 'X координата верна, Y нет'
  else
    puts 'Близко, но нет'
  end
end

compare_coordinates(coord_real,coord_find)
