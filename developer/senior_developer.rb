require_relative 'developer'

class SeniorDeveloper < Developer

  MAX_TASKS = 15

  def work!
    raise ArgumentError, 'Нечего делать!' if @tasks.empty?
    rand > 0.5 ? (puts 'Что-то лень') : 2.times { make_task }
  end

end


