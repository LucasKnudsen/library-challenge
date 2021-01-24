require './lib/librarian.rb'
require 'date'

describe Librarian do
    let(:reader) { instance_double('Reader', rented_books: []) }
    before do
        allow(reader).to receive(:rented_books=)
    end

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
        subject.check_out(book, reader: reader)
        expect(subject.check_availability(book)).to eq false
    end
    
    it 'cant check out books if availability is false' do
        book = "Moby Dick"
        subject.check_out(book, reader: reader)
        expect { subject.check_out(book, reader: reader) }.to raise_error 'This book is unavailable'
    end

    it 'on checkout, a return date will be added to the list' do
        book = "Moby Dick"
        subject.check_out(book, reader: reader)
        expected_output = Date.today.next_month.strftime("%d/%m")
        expect(subject.books[0][:return_date]).to eq expected_output
    end

    it 'can retrieve a list of all books that are rented out' do
        subject.check_out("Moby Dick", reader: reader)
        subject.check_out("Big Fish", reader: reader)
        expected_output = ["Moby Dick", "Big Fish"]
        expect(subject.check_rented_books).to eq expected_output
    end

    describe 'Reader' do
        let(:reader) { instance_double('Reader', rented_books: []) }
        before do
            allow(reader).to receive(:rented_books=)
        end

        it 'has no rented books on initialize' do
            expect(reader.rented_books).to eq []
        end

        it 'adds book to Reader/s rented_books list' do
            book = "Moby Dick"
            subject.check_out(book, reader: reader)
            expected_output = [{ title: book, author: 'Herman Melville' }]
            expect(reader.rented_books).to eq expected_output
        end


    end

end