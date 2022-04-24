#data structure of task
class Task 
  attr_accessor :name, :desc
    def initialize (name, desc)
      @name = name
      @desc = desc
    end
end
# #Create new task
# def create
#     prompt = TTY::Prompt.new
#     prompt.select("Select an option: ") do |menu|
#         menu.choice "Create a new task", -> {new_task}
#         menu.choice "Cancel", -> {main}
#         system "clear"
#     end
# end

# def create_task
#     prompt = TTY::Prompt.new() #creates new task object
#     name = prompt.ask("Enter Task name: ")
#     desc = prompt.ask("Enter Task Description: ")
#     task = Task.new(name, desc) #assigns to variable

#     @logged_in_user.tasks << task
# end
# # def view_task

# # end

# # #Task Options within View Tasks
# # def task_options
# #     prompt = TTY::Prompt.new
# #     prompt.select("What would you like to do with this file?") do |menu|
# #         menu.choice "Mark as Complete", -> {complete}
# #         menu.choice "Modify Task", -> {modify}
# #         menu.choice "Delete Task(s)", -> {delete}
# #     end
# #     menu.choice "Back", -> {main}
# # end

# # def complete

# # end

# # def modify

# # end
### implement later (working)
# #Loading bar
# bar = TTY::ProgressBar.new("Loading... [:bar]".yellow, total: 20) 
#     20.times do
#         sleep(0.08)
#         bar.advance
#     end
# system "clear"
