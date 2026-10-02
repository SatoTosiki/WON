require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "requires a title and author" do
    book = Book.new(title: "", author: "")

    assert_not book.valid?
    assert_includes book.errors[:title], "can't be blank"
    assert_includes book.errors[:author], "can't be blank"
  end

  test "requires a positive integer page count when provided" do
    book = books(:one)
    book.page_count = 0

    assert_not book.valid?
    assert_includes book.errors[:page_count], "must be greater than 0"
  end
end
