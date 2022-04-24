require 'tty-prompt'

class MasterData 
  attr_accessor :master_data, :logged_in_user #enables read and write access for master_data and logged_in_user

  def initialize() #activates instance variables @master_data and @logged_in _user
   @master_data = []
   @logged_in_user = nil
 end

  def create_user 
   prompt = TTY::Prompt.new()
   username = prompt.ask("Enter username: ")
   password = prompt.mask("Enter password: ")
   fname = prompt.ask("Enter your first name: ")
   user = User.new(username, password, fname) #creates new user object
   @master_data << user  #puts user data into @master_data
   @logged_in_user = user #reassigns user to @logged_in_user variable
 end

 def login(masterData)
  system "clear"
  prompt = TTY::Prompt.new()
  username = prompt.ask("Enter username: ")
  password = prompt.mask("Enter password: ")

  error_msg = "INCORRECT USER OR PASSWORD"

  user_index = get_user(username)

  if user_index #example of circumventing error
    user = masterData.master_data[user_index]
    if (user.password == password)
      puts "WE HAVE LOGGED IN #{user.fname}"
      @logged_in_user = user
    else
      puts error_msg
    end
  else
    puts error_msg
  end
 end

 def is_logged_in?
  if @logged_in_user
    return true
  else
    return false
  end
 end

  def get_user(username) #method finds the username from masterdata and returns it with the index
   @master_data.each_with_index { |user, index|
     if user.username == username
      return index
     end      
    }
    return nil
  end

 def create_task
   prompt = TTY::Prompt.new() #creates new task object
   name = prompt.ask("Enter Task name: ")
   desc = prompt.ask("Enter Task Description: ")
   task = Task.new(name, desc) #assigns to variable
   @logged_in_user.tasks << task #stores task into the logged in user's task list
 end
end