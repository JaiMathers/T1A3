def splash(masterData)
  prompt = TTY::Prompt.new
  selected_choice = ""
  prompt.select("Welcome, select an option: ") do |menu|
    menu.choice "Login", -> {selected_choice = "login"}
    menu.choice "Create Account", -> {selected_choice = "register"}
    menu.choice "Exit", -> {system "clear"}
  end
  
  puts selected_choice
	if selected_choice == "login"
		masterData.login(masterData)
  else
		masterData.create_user
	end

  if (masterData.is_logged_in?)
    dashboard(masterData)
  else
    splash(masterData)
  end
  # pp masterData
end

def dashboard(masterData)
  # system "clear"
  puts "WE ARE LOGGED IN"
  # puts "Weclome #{masterData.logged_in_user.fname}"
  prompt = TTY::Prompt.new
  selected_choice = ""
  prompt.select("Welcome, select an option: ") do |menu|
    menu.choice "Add Taskj", -> {selected_choice = "login"}
    menu.choice "Remove Task", -> {selected_choice = "register"}
    menu.choice "Logout", -> {selected_choice = "register"}
    menu.choice "Exit", -> {system "clear"}
  end
end

# def main
#   system "clear"
#   prompt = TTY::Prompt.new
#   prompt.select("=======================\r\nWelcome to Helping Hand\r\n=======================\r\nWhat would you like to do?") do |menu|
#   menu.choice "Create Task", -> {create_task}
#   menu.choice "View Tasks", -> {view_task}
#   menu.choice "Get a Quote", -> {get_quote}
#   menu.choice "Exit", -> {check}
#   end
# end

# #Exit check
# def exit_check
#   prompt = TTY::Prompt.new
#   prompt.yes?("Are you sure you want to exit?") do |option| #(Y/n)
#     # if (option == "")
#     # system "clear"
#     pp option 
#   end
# end