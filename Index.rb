#Gems
require 'colorize'
require 'tty-prompt'
require 'tty-progressbar'
require 'json'
#.rb Pages
require_relative("./Main.rb")
require_relative("./Users.rb")
require_relative("./Tasks.rb")
require_relative("./Quotes.rb")
require_relative("./MasterData.rb")

masterData = MasterData.new()

user1 = User.new("User1", "pass1", "John")
user2 = User.new("User2", "pass2", "Jimbo")
user3 = User.new("User3", "pass3", "Dane")

masterData.master_data << user1
masterData.master_data << user2
masterData.master_data << user3

#data structure of MasterData

splash(masterData)