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

    def check_out(title, reader_arg = {})
        book = @books.detect { |list| list[:book][:title] == title }
        
        if book[:available] == true
            book[:available] = false
            reader = reader_arg[:reader]
            reader.rented_books.push({ title: book[:book][:title], author: book[:book][:author] })
            set_return_date(book)
        else
            raise 'This book is unavailable'
        end
        # File.open('./lib/data.yml', 'w') { |f| f.write books.to_yaml }
    end

    def check_rented_books
        book_list = @books.select { |item| item[:return_date]}
        title_list = []
        book_list.each { |hash| title_list.push(hash[:book][:title]) }
        title_list
    end

    private

    def generate_quote
        picker = rand(0..5)
        case picker
            when picker = 0
                'My, what a fantastic choice!'
            when picker = 1
                'A reader lives a thousand lives before he dies.'
            when picker = 2
                'Books are a uniquely portable magic.'
            when picker = 3
                'A room without books is like a body without a soul.'
            when picker = 4
                'There is more treasure in books than in all the pirate’s loot on Treasure Island.'
            else
                'Reading is to the mind what exercise is to the body.'
        end
    end

    
    def set_return_date(book)
        date = book[:return_date] = Date.today.next_month.strftime("%d/%m")
        "#{generate_quote()} Please return the book before: #{date}"
    end


end