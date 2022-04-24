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

splash(masterData)