require_relative 'book'

describe "Book" do
  it "return_book_in should return a json with when passed argument 'json'" do
    expected = {title: "Vol de Nuit", author: "Exupery"}.to_json
    expect(Book.new("Vol de Nuit", "Exupery").return_book_in('json')).to eq expected
  end

  it "return_book_in should return a csv string with when passed argument 'csv'" do
    expected = CSV.generate do |csv|
      csv << ["Book title", "Author"]
      csv << ["Le Petit Prince", "Exupery"]
    end
    expect(Book.new("Le Petit Prince", "Exupery").return_book_in('csv')).to eq expected
  end

  it "return_book_in should return a csv string with when passed argument 'csv'" do
    expect(Book.new("Alchimist", "Paolo").return_book_in("pdf")).to eq "Error:Format not supported"
  end
end
