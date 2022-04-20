#Gems
require 'colorize'
require 'tty-prompt'
require 'tty-progressbar'

#Create new task
def create
    puts loading
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
    puts loading
    system "clear"
    print @quotes["q1"];
    puts "\r\n\n\nRemember, we're not born perfect, get out there and give it your best!\r\n\n"
    prompt = TTY::Prompt.new
    prompt.keypress("Press Enter to return...", keys: [:return])
    system "clear"
    puts main
end