raise ArgumentError, "wrong number of arguments (#{ARGV.length} for 4)" unless ARGV.length == 4
ARGV.each{ |a| raise TypeError, 'you should input only positive numbers' unless a.to_i > 0}

first_c = [ARGV[0].to_i, ARGV[1].to_i]
second_c = [ARGV[2].to_i, ARGV[3].to_i]

case
  when first_c == second_c
    puts 'Точка найдена!'
  when first_c[1] == second_c[1]
    puts 'Y координата верна, X нет'
  when first_c[0] == second_c[0]
    puts 'X координата верна, Y нет'
  else
    puts 'Близко, но нет'
end
