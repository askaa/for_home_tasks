require_relative 'developer/developer'
require_relative 'developer/junior_developer'
require_relative 'developer/senior_developer'
class Team

  attr_reader :seniors, :developers, :juniors

  def initialize(&block)
    @team = []
    @priority = []
    @message = {}
    instance_eval &block
  end

  def add_task(task)
    @sorted = @team.select { |dev| dev.can_add_task? }
                 .sort_by { |dev| [@priority.index(dev.group), dev.number_of_tasks] }
    dev = @sorted.first
    dev.add_task(task)
    @message[formatter(dev.group)].call(dev, task) if @message[formatter(dev.group)]
  end

  def developers
    @team.select{ |person| person.group == :developers }
  end

  def seniors
    @team.select{ |person| person.group == :seniors }
  end

  def juniors
    @team.select{ |person| person.group == :juniors }
  end

  def all
    @team
  end

  def report
    @sorted.each do |dev|
      puts "#{dev.name} (#{formatter(dev.group)}): #{dev.tasks.gsub("\n", ', ')}"
    end
  end

  private
  def have_seniors(*names)
    names.map { |name| @team << SeniorDeveloper.new(name) }
  end

  def have_developers(*names)
    names.map { |name| @team << Developer.new(name) }
  end

  def have_juniors(*names)
    names.map { |name| @team << JuniorDeveloper.new(name) }
  end

  def priority(*classes)
    classes.each { |c| @priority << c }
  end

  def on_task (type, &block)
    @message[type] = block if block_given?
  end

  def formatter(type)
    type.to_s.chop.to_sym
  end

end

team = Team.new do
  # создаём команду, описываем её в этом блоке

  # описываем, какие в команде есть разработчики
  have_seniors "Олег", "Оксана"
  have_developers "Олеся", "Василий", "Игорь-Богдан"
  have_juniors "Владислава", "Аркадий", "Рамеш"

  # описываем в каком порядке выдавать задачи:
  # * сначала любому джуниору
  # * потом любому обычному разработчику
  # * потом любому старшему
  priority :juniors, :seniors, :developers

  # описываем дополнительные действия, когда задача выдана джуну

end

team.add_task 'Погладить шнурки'
team.add_task 'Погладить обои'
team.add_task 'Погладить нос'
team.add_task 'Погладить кота'
team.add_task 'Погладить дева'
team.all
team.report
