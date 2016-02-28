require_relative 'developer/developer'
require_relative 'developer/junior_developer'
require_relative 'developer/senior_developer'
 class Team

   attr_reader :seniors, :developers, :juniors

   def initialize(&block)
     @team = []
     @priority = []
     instance_eval &block
     group_team
   end

   def add_task(task)
    sorted = @team.select{|person| person.can_add_task?}
         .sort_by{|person| [@priority.index(person.group), person.number_of_tasks]}
     sorted.first.add_task(task)
   end

   def priority(*classes)
     classes.each {|c| @priority << c }
   end

   def all
     @team
   end

   def report
     @team.each { |person| puts "#{person.name} (#{person.group}): #{person.tasks.gsub("\n", ', ')}" }
   end

   private
   def have_seniors(*names)
     names.map{ |name| @team << SeniorDeveloper.new(name) }
   end

   def have_developers(*names)
     names.map{ |name| @team << Developer.new(name) }
   end

   def have_juniors(*names)
     names.map{ |name| @team << JuniorDeveloper.new(name) }
   end

    def group_team
      @developers = [], @seniors = [], @juniors = []
      @team.each do |person|
        case person
          when SeniorDeveloper then @seniors << person
          when JuniorDeveloper then @juniors << person
          else @developers << person
        end
      end
    end

   def on_task(&block)
     block.call #
   end

 end


