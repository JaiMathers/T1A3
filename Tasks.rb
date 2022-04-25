#data structure of task
class Task 
  attr_accessor :name, :desc
    def initialize (name, desc)
      @name = name
      @desc = desc
    end

    def to_s
      return "Task: #{@name} \n Description: #{@desc}"
    end
end