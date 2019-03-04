class Library

  attr_accessor :books
  def initialize(books)
    @library_books = books
  end

  def get_books
    return @library_books
  end

  def get_book_by_title(title)
    bookfound=nil
    for book in @library_books
      bookfound = book if ( book[:title] == title )
    end
    return bookfound
  end

  def get_rental_details_by_title(title)
    rental_details=nil
    for book in @library_books
#      rental_details = book[:rental_details] if ( book[:title] == title )
    # ok it's going to go through the whole loop but I only have a library of 2...
# fix that long loop!
      return book[:rental_details] if ( book[:title] == title )
    end
    return rental_details
  end

  def add_new_book(new_book)
#    p "New book: #{new_book}"
    @library_books << new_book if (new_book != nil)
#    p "New Library:  #{@library_books}"
  end

  # def add_new_library_book(new_library_book)
  #     p "New book: #{new_library_book}"
  #   @library_books << new_library_book if (new_library_book != nil)
  #     p "New Library:  #{@library_books}"
  # end

  def add_new_book_2(title,name,date)
  #    p "New book: #{new_book}"
  # new_book=Hash.new()
  # new_book[:title]=title
  # new_rental_details=Hash.new()
  # new_rental_details[:student_name]=name
  # new_rental_details[:date]=date
  # new_book[:rental_details]=new_rental_details
  new_book={title: title, rental_details: {student_name: name, date: date}}
    @library_books << new_book if (new_book != nil)
  #   p "New Library:  #{@library_books}"
  end


  def update_details(title,name,date)
    mybook=get_book_by_title(title)
#    p mybook
    new_rental_details=Hash.new()
    new_rental_details[:student_name]=name
    new_rental_details[:date]=date
  #  p new_rental_details
    array_position=@library_books.index(mybook)
#    p array_position
    @library_books[array_position][:rental_details]=new_rental_details
#    p @library_books
  end

end # end class

## # TODO: new class - kind of thing we'll do tomorrow?
# class LibraryBook
#
# attr_reader :title
# attr_accessor :rental_details
#
# def initialize(title, student, date)
#   @title = title
#   @rental_details={ student_name: student, due_date: date  }
# end
#
# end # end class
