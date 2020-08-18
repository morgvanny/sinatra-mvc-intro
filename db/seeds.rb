Book.destroy_all

adapter = GoogleBooks::Adapter.new
adapter.fetch_books("Angela Davis")
adapter.fetch_books("Kwame Ture")
adapter.fetch_books("Oscar Wilde")
adapter.fetch_books("Karl Marx")
adapter.fetch_books("Vladimir Lenin")
adapter.fetch_books("Marcel Duchamp")
