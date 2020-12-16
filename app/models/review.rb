class Review < ApplicationRecord
  belongs_to :book, optional: true
  belongs_to :reviewer, class_name: 'User', optional: true
end
