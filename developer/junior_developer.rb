require_relative 'developer'

class JuniorDeveloper < Developer

  MAX_TASKS = 5

  def group
    @group = :juniors
  end

  def add_task(task)
    raise ArgumentError, 'Слишком сложно!' if task.length > 20
    super
  end

  def work!
    puts %Q{#{@name}: пытаюсь делать задачу "#{@tasks.first}". Осталось задач: #{@tasks.length}}
    super
  end

end
