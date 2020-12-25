class Book < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  has_many :reviews, dependent: :delete_all
end
