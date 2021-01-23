require 'date'
require 'pry'
# read = YAML.load_file('./lib/data.yml')
# write = File.open('./lib/data.yml', 'w') { |f| f.write collection.to_yaml }
# search for first (strict) = .detect { |list| list[:book][:title] }
# search 2 (less strict) = use .include? so we dont need the whole title
# search 3 = .select returns all of the objects evaluated to true

class Librarian 

    attr_accessor :books
    def initialize
        @books = YAML.load_file('./lib/data.yml')
    end

end