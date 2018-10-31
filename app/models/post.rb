class Post < ApplicationRecord
  searchkick
  has_many :comments, dependent: :destroy
end
