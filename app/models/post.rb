class Post < ApplicationRecord
  searchkick
  has_many :comments, dependent: :destroy
  validates :title, :body, presence: true

end
