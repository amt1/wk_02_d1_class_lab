require('minitest/autorun')
require('minitest/rg')
require_relative('../library_class')

class TestLibraryClass < MiniTest::Test

def setup

  @books=[
    {
      title: "Lord of the Rings",
      rental_details: {
       student_name: "Trevis",
       date: "01/04/19"
      }
    },
      {
        title: "The Shipping News",
        rental_details: {
         student_name: "Flotter",
         date: "02/04/19"
        }
      }
  ]
end

def test_get_books
  mylibrary=Library.new(@books)
  assert_equal( @books, mylibrary.get_books )
end

def test_get_book_by_title
  mylibrary=Library.new(@books)
  mybook = mylibrary.get_book_by_title("The Shipping News")
  assert_equal( @books[1], mybook )
end

def test_get_rental_details_by_title
  mylibrary=Library.new(@books)
  my_book_rental_details = mylibrary.get_rental_details_by_title( "Lord of the Rings" )
  assert_equal( @books[0][:rental_details], my_book_rental_details )
end

def test_add_new_book
  mylibrarybook={title: "The Gruffalo Cookbook", rental_details: {student_name: "", date: ""}}
  mylibrary=Library.new(@books)
  mylibrary.add_new_book(mylibrarybook)
assert_equal( @books[-1][:title], mylibrarybook[:title])
assert_equal( @books[-1][:title], "The Gruffalo Cookbook")
end

def test_add_new_book_2
#  mylibrarybook={title: "Gone Girl", rental_details: {student_name: "", date: ""}}
  mylibrary=Library.new(@books)
  mylibrary.add_new_book_2("Gone Girl",nil,nil)
# assert_equal( @books[-1][:title], mylibrarybook[:title])
assert_equal( @books[-1][:title], "Gone Girl")
end

def test_update_rental_details
    mylibrary=Library.new(@books)
   mylibrary.update_details("The Shipping News","Rolf","01/05/19")
   check_new_rental_details=mylibrary.get_rental_details_by_title("The Shipping News")
   assert_equal("Rolf",check_new_rental_details[:student_name])
end

## # TODO: new library book class
# def test_add_new_library_book
#   mylibrarybook=LibraryBook.new("The Gruffalo Cookbook",nil,nil)
#   mylibrary=Library.new(@books)
#   mylibrary.add_new_library_book(mylibrarybook)
# assert_equal( @books[-1][:title], mylibrarybook[:title])
# assert_equal( @books[-1][:title], "The Gruffalo Cookbook")
# end



end # end class
