require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'kushie islands', comments_counter: 5, likes_counter: 10) }
  before { subject.save }
  it 'is not valid without title' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without comments_counter' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end
  it 'should return comments_counter greater than zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end
  it 'should return likes_counter greater than zero' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end
end
