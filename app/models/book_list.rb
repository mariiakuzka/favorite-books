class BookList < ApplicationRecord
has_and_belongs_to_many :favorite_books
belongs_to :user
scope :shared, -> {where(public: true)} 

end
