require 'date'
require 'pry'
# read = YAML.load_file('./lib/data.yml')
# write = File.open('./lib/data.yml', 'w') { |f| f.write books.to_yaml }
# search for first (strict) = list.detect { |list| list[:book][:title] }
# search 2 (less strict) = use .include? so we dont need the whole title
# search 3 = list.select returns all of the objects evaluated to true

class Librarian 

    attr_accessor :books
    def initialize
        @books = YAML.load_file('./lib/data.yml')
    end
    
    public
    
    def check_availability(title)
        # find_title = lambda(title) { |list| list[:book][:title].include? title }
        # book = @books.detect { find_title.call(title) }
        book = @books.detect { |list| list[:book][:title] == title }
        book[:available]
    end

    def check_out(title)
        book = @books.detect { |list| list[:book][:title] == title }
        book[:available] = false
        set_return_date(book)
        
        # File.open('./lib/data.yml', 'w') { |f| f.write books.to_yaml }
    end

    private
    
    def set_return_date(book)
        date = book[:return_date] = Date.today.next_month.strftime("%d/%m")
        "Thank you using our Library! Please return the book before: #{date}"
    end


end