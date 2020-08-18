module GoogleBooks
  class Adapter
    BASE_URL = 'https://www.googleapis.com/books/v1/volumes?q='

    def fetch_books(author)
      books = JSON.parse(RestClient.get(author_url(author))

      books['items'].each do |item|
        book = ::Book.new
        book.author = author
        book.title = item['volumeInfo']['title']
        book.snippet = item['volumeInfo']['description']

        book.save
      end
    end

    private

    def author_url(author, max_results = 5)
      "#{BASE_URL}\"#{author}\"&inauthor:\"#{author}\"&maxResults=#{max_results}"
    end

    def author_sanitizer(author)
      author.gsub(/\W+/, '+').downcase
    end
  end
end
