class User < ApplicationRecord
  has_many :posts, foreign_key: "author_id"
  has_many :books, foreign_key: "author_id"
  has_many :reviews, foreign_key: "reviewer_id"
end
