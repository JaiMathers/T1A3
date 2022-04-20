#Gems
require 'colorize'
require 'tty-prompt'
require 'tty-progressbar'
require 'json'
#.rb Pages
require_relative("./Quotes.rb")
require_relative("./Users.rb")
require_relative("./Tasks.rb")

#database
#file = File.read('./database.json')
#data_hash = JSON.parse(file)



#Main menu

def main
    prompt = TTY::Prompt.new
    prompt.select("""
========================
Welcome to Task Manager
========================
Select an option: 
    """) do |menu|
        menu.choice "Create Task", -> {create}
        menu.choice "View Tasks", -> {view_task}
        menu.choice "Get a Quote", -> {get_quote}
        menu.choice "Exit", -> {check}
    end
end


#Initial loading bar
bar = TTY::ProgressBar.new("Loading... [:bar]", total: 5)
20.times do
    sleep(0.1)
    bar.advance
end
system ("clear")

#Account creation
prompt = TTY::Prompt.new
prompt.ask("Enter username: ") do |q|
    q.required true
    #q.validate /\A\w+\Z/
    q.modify :down
end
system ("clear")

main


