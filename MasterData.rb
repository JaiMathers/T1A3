require 'tty-prompt'
require 'json'
require 'bcrypt'

class MasterData 
  attr_accessor :master_data, :logged_in_user #enables read and write access for master_data and logged_in_user

  def initialize() #activates instance variables @master_data and @logged_in _user
    @master_data = []
    @logged_in_user = nil
    load()
  end

 # USER METHODS

  def create_user 
    prompt = TTY::Prompt.new()
    username = prompt.ask("Enter username: ", required: true)
    password = prompt.mask("Enter password: ", required: true)
    password = BCrypt::Password.create(password)
    fname = prompt.ask("Enter your first name: ", required: true)
    user = User.new(username, password, fname) #creates new user object
    @master_data << user  #puts user data into @master_data
    @logged_in_user = user #reassigns user to @logged_in_user variable
    save()
  end

  def login
    system "clear"
    prompt = TTY::Prompt.new()
    username = prompt.ask("Enter username: ", required: true)
    password = prompt.mask("Enter password: ", required: true)

    error_msg = "INCORRECT USER OR PASSWORD"

    user_index = get_user(username)

    if user_index #example of circumventing error
      user = @master_data[user_index]
      if (BCrypt::Password.new(user.password) == password)
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

  # TASK METHODS
  def create_task
    prompt = TTY::Prompt.new()
    name = prompt.ask("Enter Task name: ", required: true)
    desc = prompt.ask("Enter Task Description: ", required: true)
    task = Task.new(name, desc) #assigns to variable
    @logged_in_user.tasks << task #stores task into the logged in user's task list
    save()
  end

  def mark_as_complete(index)
    task = @logged_in_user.tasks[index]
    @logged_in_user.completed_tasks << task
    @logged_in_user.tasks.delete_at(index)
    save()
  end

  def delete_task(index)
    @logged_in_user.tasks.delete_at(index)
    save()
  end

  def delete_completed_task(index)
    @logged_in_user.completed_tasks.delete_at(index)
    save()
  end

  def edit_task(index) 
    prompt = TTY::Prompt.new()
    name = prompt.ask("Enter Task name: ", required: true)
    desc = prompt.ask("Enter Task Description: ", required: true)

    task = @logged_in_user.tasks[index]
    task.name = name
    task.desc = desc
    save()
  end

  def load #for loading data in from db.json. 
    if (File.exists?("db.json")) #reads and verifies user data
      raw_data = File.read("db.json")
      data = JSON.parse(raw_data, create_additions: true)
      data.each { |user| 
        new_user = User.new(user["username"], user["password"], user["fname"])
        new_user.tasks = JSON.parse(user["tasks"])
        new_user.completed_tasks = JSON.parse(user["completed_tasks"])

        @master_data << new_user
      }

  else #if db.json doesn't exist, creates it for data storage
      newdb = File.new("./db.json", 'w+')
      tmp = []
      newdb.syswrite(tmp.to_json)
    end
  end

  def save #for writing data to db.json
    file = File.open("db.json", "w+")
    file.syswrite(@master_data.to_json)
  end
 

end