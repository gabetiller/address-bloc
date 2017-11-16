require_relative '../models/address_book'

RSpec.describe AddressBook do
  let(:book) {AddressBook.new}

  def check_entry(entry, expected_name, expected_number, expected_email)
  expect(entry.name).to eq expected_name
  expect(entry.phone_number).to eq expected_number
  expect(entry.email).to eq expected_email
  end

  describe "attributes" do
    it "responds to entries and imports the first entry" do
      expect(book).to respond_to(:entries)
      book.import_from_csv("entries.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
    end

     it "imports the 2nd entry" do
       book.import_from_csv("entries.csv")
       # Check the second entry
       entry_two = book.entries[1]
       check_entry(entry_two, "Bob", "555-555-5415", "bob@blocmail.com")
     end

     it "imports the 3rd entry" do
       book.import_from_csv("entries.csv")
       # Check the third entry
       entry_three = book.entries[2]
       check_entry(entry_three, "Joe", "555-555-3660", "joe@blocmail.com")
     end

     it "imports the 4th entry" do
       book.import_from_csv("entries.csv")
       # Check the fourth entry
       entry_four = book.entries[3]
       check_entry(entry_four, "Sally", "555-555-4646", "sally@blocmail.com")
     end

     it "imports the 5th entry" do
       book.import_from_csv("entries.csv")
       # Check the fifth entry
       entry_five = book.entries[4]
       check_entry(entry_five, "Sussie", "555-555-2036", "sussie@blocmail.com")
     end
   end

   context "importing from entries2.csv" do
    it "imports the correct number of entries" do
      book.import_from_csv("entries2.csv")
      expect(book.entries.size).to eq 3
    end

    it "imports the first entry" do
      book.import_from_csv("entries2.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Clark", "123-234-4323", "clark@bagwell.com")
    end

    it "imports the second entry" do
      book.import_from_csv("entries2.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Gabe", "970-318-6585", "gabe@telluride.com")
    end

    it "imports the third entry" do
      book.import_from_csv("entries2.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Sally", "919-413-2564", "sally@yahoo.com")
  end
end

describe "#iterative_search" do
  it "searches AddresBook for a non-existent entry" do
    book.import_from_csv("entries.csv")
    entry = book.iterative_search("Dan")
    expect(entry).to be_nil
    end
  end

  it "searches AddressBook for Bill" do
    book.import_from_csv("entries.csv")
    entry = book.iterative_search("Bill")
    expect(entry).to be_a Entry
    check_entry(entry, "Bill", "555-555-4854", "bill@blocmail.com")
  end

  it "searches AddressBook for Bob" do
     book.import_from_csv("entries.csv")
     entry = book.iterative_search("Bob")
     expect(entry).to be_a Entry
     check_entry(entry, "Bob", "555-555-5415", "bob@blocmail.com")
   end

   it "searches AddressBook for Joe" do
     book.import_from_csv("entries.csv")
     entry = book.iterative_search("Joe")
     expect(entry).to be_a Entry
     check_entry(entry, "Joe", "555-555-3660", "joe@blocmail.com")
   end

   it "searches AddressBook for Sally" do
     book.import_from_csv("entries.csv")
     entry = book.iterative_search("Sally")
     expect(entry).to be_a Entry
     check_entry(entry, "Sally", "555-555-4646", "sally@blocmail.com")
   end

   it "searches AddressBook for Sussie" do
     book.import_from_csv("entries.csv")
     entry = book.iterative_search("Sussie")
     expect(entry).to be_a Entry
     check_entry(entry, "Sussie", "555-555-2036", "sussie@blocmail.com")
   end

   it "searches AddressBook for Billy" do
       book.import_from_csv("entries.csv")
       entry = book.iterative_search("Billy")
       expect(entry).to be_nil
     end

end
