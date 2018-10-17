class Author < ApplicationRecord
  has_many :author_books
  has_many :books, through: :author_books

  validates :name, presence: true
  validates :birth_year, presence: true
end
