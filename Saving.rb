module Fs #file system
    def initialize()
        @users = []
        load_files()
    end

    def load_files
        # puts "Loading Files"
        if(File.exist?('db.json'))
            raw_data = File.read('db.json')
            # @users = JSON.parse(raw_data)
        else # create file if not found -> stringify tmp -> save string into db.json
            puts "File not found, creating db..."
            File.new("./db.json", 'w+')
            tmp = []
        end
    end
end