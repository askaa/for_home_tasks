class Developer

    MAX_TASKS = 10

  def initialize(name)
    @name = name
    @tasks = []
  end

  def add_task(task)
    raise ArgumentError, 'Слишком много работы!' if @tasks.length >= max_tasks
    @tasks << task
    puts %Q{#{@name}: добавлена новая задача "#{task}". Всего в списке задач: #{@tasks.length}}
  end

  def tasks
    @tasks.each_with_index.map { |task, index| "#{index + 1}. #{task}" }.join("\n")
  end

  def work!
    raise ArgumentError, 'Нечего делать!' if @tasks.empty?
    make_task
  end

  def status
    result = case @tasks.length
               when 0 then 'свободен'
               when 1..max_tasks-1 then 'работаю'
               else 'занят'
             end
    puts result
  end

  def can_add_task?
    @tasks.length < max_tasks
  end

  def can_work?
    @tasks.length > 0
  end

  private
  def max_tasks
    self.class::MAX_TASKS
  end

  def make_task
    unless @tasks.empty?
      puts %Q{#{@name}: выполнена задача "#{@tasks.shift}". Осталось задач: #{@tasks.length}}
    end
  end

end

