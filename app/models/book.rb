class Book < ApplicationRecord
  validates :title, :author, presence: true
  validates :page_count, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
end
