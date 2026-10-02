require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post books_url, params: { book: { author: @book.author, page_count: @book.page_count, published_on: @book.published_on, title: @book.title } }
    end

    assert_redirected_to book_url(Book.last)
    assert_equal @book.title, Book.last.title
  end

  test "should not create a book without required fields" do
    assert_no_difference("Book.count") do
      post books_url, params: { book: { author: "", title: "" } }
    end

    assert_response :unprocessable_content
    assert_select "li", text: /Title can't be blank/
    assert_equal "We couldn't save this book. Please review the errors below.", flash[:alert]
  end

  test "should return not found for a missing book" do
    get book_url(id: "missing")

    assert_redirected_to books_url
    assert_equal "The requested book could not be found.", flash[:alert]
  end

  test "should return a JSON error for a missing book" do
    get book_url(id: "missing", format: :json)

    assert_response :not_found
    assert_equal "The requested book could not be found.", response.parsed_body["error"]
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author, page_count: @book.page_count, published_on: @book.published_on, title: @book.title } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
