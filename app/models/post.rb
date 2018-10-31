class Post < ApplicationRecord
  searchkick
  has_many :comments, dependent: :destroy
  validates :title, :body, presence: true

  def post_length_in_minutes
    if self.body.blank?
      min = 0 
    else 
      min = self.body.split(" ").size / 200
    end
    if min == 0
      'less than a minute read'
    else
      "#{min} min read"
    end
  end

end
