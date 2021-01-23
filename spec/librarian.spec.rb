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

    describe 'Reader' do
        let(:reader) { instance_double('Reader', rented_books: []) }
        before do
            allow(reader).to receive(:rented_books=)
        end

        it 'has no rented books on initialize' do
            expect(reader.rented_books).to eq []
        end


    end

end