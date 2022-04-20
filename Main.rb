#Splash screen
def splash
    prompt = TTY::Prompt.new
    prompt.select("Welcome, select an option: ") do |menu|
        menu.choice "Login", -> {login}
        menu.choice "Create Account", -> {create_account}
        menu.choice "Exit", -> {check}
    end
    
end


#Login
def login
    prompt = TTY::Prompt.new
    $user = prompt.ask("Enter username: ")
    puts loading
    #answer = Users.find_by(username: username)
    # if answer
    #     $user = answer
    #     puts "Hello #{$user.light_green}, please wait a moment." 
    # else
    #     puts "Username not found"
    #     puts login
    # end
    # system "clear"
end

def create_account
    
end

#Main menu
def main
prompt = TTY::Prompt.new
prompt.select("==========================
 Welcome to Task Manager
==========================
What would you like to do?")do |menu|
        menu.choice "Create Task", -> {create}
        menu.choice "View Tasks", -> {view_task}
        menu.choice "Get a Quote", -> {get_quote}
        menu.choice "Exit", -> {check}
    end
end

#Loading bar
def loading
    bar = TTY::ProgressBar.new("Loading... [:bar]".yellow, total: 20) 
        20.times do
            sleep(0.08)
            bar.advance
        end
    system "clear"
end

#Exit check
def check
    prompt = TTY::Prompt.new
    prompt.yes?("Are you sure you want to exit?") #(Y/n)
    system "clear"
end