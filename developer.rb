class Developer

    MAX_TASKS = 10


  def initialize(name)
    @name = name
    @tasks = []
    self.class::MAX_TASKS
  end

  def add_task(task)
    raise ArgumentError, 'Слишком много работы!' if @tasks.length >= MAX_TASKS
    @tasks << task
    puts "#{@name}: добавлена новая задача \"#{task}\". Всего в списке задач: #{@tasks.length}"
  end

  def tasks
     result = []
    @tasks.each_with_index { |task, index| result << "#{index + 1}. #{task}" }
     result
  end

  def work!
    raise ArgumentError, 'Нечего делать!' if @tasks.empty?
    puts "#{@name}: выполнена задача #{@tasks.first}. Осталось задач: #{@tasks.length - 1}"
    delete_first_task
  end

  def status
    result = case @tasks.length
               when 0 then 'свободен'
               when 1..MAX_TASKS-1 then 'работаю'
               else 'занят'
             end
    puts result
  end

  def can_add_task?
    @tasks.length < MAX_TASKS ? true : false
  end

  def can_work?
    @tasks.length > 0 ? true : false
  end

  private
  def delete_first_task
    @tasks.delete_at(0)
  end
end

