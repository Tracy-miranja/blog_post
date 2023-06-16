class Post < ApplicationRecord
  has_many :comments
  has_many :likes
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'

  validates :title, presence: true, length: { in: 1...250 }
  validates :comments_counter, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
  validates :likes_counter, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }  

  after_create :update_user_posts_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_user_posts_counter
    author.update(posts_counter: author.posts.count)
  end
end
