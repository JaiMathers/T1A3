require_relative "./Quotes.rb"

def splash(masterData)
  prompt = TTY::Prompt.new
  selected_choice = ""
  prompt.select("Welcome, select an option: ") do |menu|
    menu.choice "Login", -> {selected_choice = "login"}
    menu.choice "Create Account", -> {selected_choice = "register"}
    menu.choice "Exit", -> {selected_choice = "exit"}
  end
  
  if selected_choice == "login"
		masterData.login
  elsif selected_choice == "register"
		masterData.create_user
  else selected_choice == "exit"
    begin
      exit
    rescue SystemExit
    end
    system "clear"
	end

  if (masterData.is_logged_in?)
    dashboard(masterData)
  end
end

def dashboard(masterData)
  system "clear"
  puts "=================================\n  Welcome to Task Tracker, #{masterData.logged_in_user.fname}  \n================================="
  prompt = TTY::Prompt.new
  selected_choice = ""
  prompt.select("Select an option: ") do |menu|
    menu.choice "View Tasks", -> {selected_choice = "view"}
    menu.choice "View Completed Tasks", -> {selected_choice = "view_completed"}
    menu.choice "Add Task", -> {selected_choice = "add"}
    menu.choice "Quotes", -> {selected_choice = "quote"}
    menu.choice "Logout", -> {selected_choice = "logout"}
    menu.choice "Exit", -> {selected_choice = "exit"}
  end

  case selected_choice
  when "view"
    system "clear"
    view_tasks(masterData)
    dashboard(masterData)
  when "view_completed"
    view_completed_tasks(masterData)
    dashboard(masterData)
  when "add"
    masterData.create_task
    dashboard(masterData)
  when "quote"
    get_quote()
    dashboard(masterData)
  when "logout"
    masterData.logged_in_user = nil
    system "clear"
    puts "You have been logged out."
    splash(masterData)
  when "exit"
    begin
      exit
    rescue SystemExit
    end
    system "clear"
  # else     #printing what type the selected choice is () [] {}
  #   puts "WHAT ARE YOU????????? #{selected_choice}"
  #   dashboard(masterData)
  end
end

def view_tasks(masterData)
  masterData.logged_in_user.tasks.each_with_index {|task, index| 
    system "clear"

    puts task.to_s

    prompt = TTY::Prompt.new
    selected_choice = ""
    prompt.select("Select an option: ") do |menu|
      menu.choice "Next", -> {selected_choice = "next"}
      menu.choice "Mark as complete", -> {selected_choice = "complete"}
      menu.choice "Delete Task", -> {selected_choice = "delete"}
      menu.choice "Edit Task", -> {selected_choice = "edit"}
    end

    case selected_choice
    when "complete"
      masterData.mark_as_complete(index)
    when "delete"
      masterData.delete_task(index)
    when "edit"
      masterData.edit_task(index)
    when "next"
      puts "next"      
    end
  }
end

def view_completed_tasks(masterData)
  masterData.logged_in_user.completed_tasks.each_with_index {|task, index| 
    system "clear"

    puts task.to_s

    prompt = TTY::Prompt.new
    selected_choice = ""
    prompt.select("Select an option: ") do |menu|
      menu.choice "Delete Task", -> {selected_choice = "delete"}
      menu.choice "Next", -> {selected_choice = "next"}
    end

    case selected_choice
    when "delete"
      masterData.delete_completed_task(index)
      dashboard(masterData)
    when "next"
      puts "next"
      dashboard(masterData)
    end
  }
end

