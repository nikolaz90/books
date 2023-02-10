require 'json'
require 'csv'

class Book
  def initialize(title, author)
    @title = title
    @author = author
  end

  def return_book_in(format_required)
    case format_required
    when "csv"
      return csv_response
    when 'json'
      return json_response
    end
  end

  private

  def json_response
    { title: @title, author: @author }.to_json
  end

  def csv_response
    CSV.generate do |csv|
      csv << ["Book title", "Author"]
      csv << [@title, @author]
    end
  end
end
