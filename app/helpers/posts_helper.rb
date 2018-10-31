module PostsHelper
  def post_length_in_minutes(post)
    if post.body.blank?
      min = 0 
    else 
      min = post.body.split(" ").size / 200
    end
    if min == 0
      'less than a minute read'
    else
      "#{min} min read"
    end
  end
end
