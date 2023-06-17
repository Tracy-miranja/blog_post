require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'kushie tracy', posts_counter: 5) }

  before { subject.save }

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is not valid without a name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is not valid with posts_counter less than zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'is not valid with non-integer posts_counter' do
    subject.posts_counter = 'hello'
    expect(subject).to_not be_valid
  end

  describe '#recent_posts' do
    it 'returns the most recent 3 posts' do
      Post.create(title: 'Post 1', created_at: 1.hour.ago, author: subject)
      Post.create(title: 'Post 2', created_at: 30.minutes.ago, author: subject)
      post3 = Post.create(title: 'Post 3', created_at: 10.minutes.ago, author: subject)
      post4 = Post.create(title: 'Post 4', created_at: 5.minutes.ago, author: subject)
      post5 = Post.create(title: 'Post 5', created_at: 2.minutes.ago, author: subject)

      expect(subject.recent_posts).to eq([post5, post4, post3])
    end
  end
end
