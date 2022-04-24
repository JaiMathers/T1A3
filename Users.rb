#data structure of user
require_relative "./Tasks.rb"

class User 
  attr_accessor :username, :password, :fname, :tasks, :completed_tasks
    def initialize (username, password, fname, tasks = [], completed_tasks = [])
      @username = username
      @password = password
      @fname = fname
      @tasks = tasks
      @completed_tasks = completed_tasks
    end



    def to_json(*args)
      {
        JSON.create_id => self.class.name,
        'username' => @username,
        'password' => @password,
        'fname' => @fname,
        'tasks' => @tasks.to_json,
        'completed_tasks' => @completed_tasks.to_json,
      }.to_json(*args)
    end
end