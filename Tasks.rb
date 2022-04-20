#Gems
require 'colorize'
require 'tty-prompt'
require 'tty-progressbar'

#Create new task
def create
    bar = TTY::ProgressBar.new("Loading... [:bar]", total: 10)
        20.times do
        sleep(0.1)
        bar.advance
    end
    system("clear")
    prompt = TTY::Prompt.new
    prompt.select("Select an option: ") do |menu|
        menu.choice "Create a new task", -> {new_task}
        menu.choice "Cancel", -> {main}
    end
end

#Task Options within View Tasks
def task_options
    prompt = TTY::Prompt.new
    prompt.select("What would you like to do with this file?") do |menu|
        menu.choice "Mark as Complete", -> {complete}
        menu.choice "Modify Task", -> {modify}
        menu.choice "Delete Task(s)", -> {delete}
    end
    menu.choice "Back", -> {main}
end

def complete
    
end

def modify

end

#Get a quote
def get_quote
        bar = TTY::ProgressBar.new("Loading... [:bar]", total: 10)
        20.times do
        sleep(0.1)
        bar.advance
    end
end

#Exit check
def check
    prompt = TTY::Prompt.new
    prompt.yes?("Are you sure you want to exit?") #(Y/n)
    system ("clear")
end