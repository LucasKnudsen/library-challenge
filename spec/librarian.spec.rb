require './lib/librarian.rb'
require 'date'

describe Librarian do
    
    it 'has a list of books on initialize' do
        expect(subject.books).to be_truthy
    end

    it 'has access to the right list of books' do
        expect(subject.books[0][:book][:title]).to eq 'Moby Dick'
    end

    it 'can check availability of books' do
        expect(subject.check_availability("Moby Dick")).to eq true
    end

end