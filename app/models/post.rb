class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  after_create :update_user_posts_counter

  private

  def update_user_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
