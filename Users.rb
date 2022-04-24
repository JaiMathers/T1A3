#data structure of user
class User 
  attr_accessor :username, :password, :fname, :tasks
    def initialize (username, password, fname)
      @username = username
      @password = password
      @fname = fname
      @tasks = []
    end
end