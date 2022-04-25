#Quotes List
class Quotes
    def quote1
        puts "It is better to fail in originality than to succeed in imitation. — Herman Melville".green
    end
    def quote2
        puts "The road to success and the road to failure are almost exactly the same. — Colin R. Davis".yellow
    end
    def quote3
        puts "You learn more from failure than from success. Don't let it stop you. Failure builds character. — Unknown".blue
    end
    def quote4
        puts "Experience is a hard teacher because she gives the test first, the lesson afterwards. ― Vernon Sanders Law".red
    end
end
#Quotes Feature
def get_quote
    system "clear"
    quotes = Quotes.new
    prompt = TTY::Prompt.new
    prompt.select("Pick a number: ") do |menu|
        menu.choice "1", -> {quotes.quote1} 
        menu.choice "2", -> {quotes.quote2}
        menu.choice "3", -> {quotes.quote3}
        menu.choice "4", -> {quotes.quote4}
    end
    
    prompt = TTY::Prompt.new
    prompt.keypress("Press Enter to return...", keys: [:return])
    system "clear"
end