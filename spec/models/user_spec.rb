require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: "kushie tracy", posts_counter: 5) }

  before { subject.save }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid with posts_counter less than zero" do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it "is not valid with non-integer posts_counter" do
    subject.posts_counter = "hello"
    expect(subject).to_not be_valid
  end

  # describe "#recent_posts" do
  #   let!(:user) { User.create(name: "kushie tracy", posts_counter: 5) }
  #   let!(:post1) { Post.create(title: "Post 1", author: user, created_at: 1.hour.ago) }
  #   let!(:post2) { Post.create(title: "Post 2", author: user, created_at: 2.hours.ago) }
  #   let!(:post3) { Post.create(title: "Post 3", author: user, created_at: 3.hours.ago) }
  #   let!(:post4) { Post.create(title: "Post 4", author: user, created_at: 4.hours.ago) }

  #   it "returns the most recent 3 posts" do
  #     expect(user.recent_posts).to eq([post4, post3, post2])
  #   end
  # end
end
