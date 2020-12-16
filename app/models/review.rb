class Review < ApplicationRecord
  belongs_to :book
  belongs_to :reviewer, class_name: 'User'
end
