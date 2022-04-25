#Gems
require 'colorize'
require 'tty-prompt'
require 'tty-progressbar'
require 'json'
require 'bcrypt'
#.rb Pages
require_relative("./Main.rb")
require_relative("./Users.rb")
require_relative("./Tasks.rb")
require_relative("./Quotes.rb")
require_relative("./MasterData.rb")

masterData = MasterData.new()

bar = TTY::ProgressBar.new("Loading...[:bar]".light_green, total: 20)
20.times do
  sleep(0.1)
  bar.advance
  system "clear"
end

splash(masterData)