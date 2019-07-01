class User < ApplicationRecord
  include Followable
  has_many :posts

  def like(post)
    post.likes.create(user: self)
  end

  def publish(description, *media)
    post = posts.create(description: description)
    media.each do |medium|
      post.media << medium
    end
    post
  end

  def comment(body, post)
    post.comments.create(user: self, body: body)
  end
end