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

    it 'can check out books, meaning availability will change to false' do
        book = "Moby Dick"
        subject.check_out(book)
        expect(subject.check_availability(book)).to eq false
    end

    # it 'on checkout, a return date will be added to the list'

    describe 'Reader' do
        let(:reader) { instance_double('Reader', name: 'Billy', rented_books: []) }
        before do
            allow(reader).to receive(:rented_books=)
        end

        it 'has no rented books on initialize' do
            expect(reader.rented_books).to eq []
        end


    end

end