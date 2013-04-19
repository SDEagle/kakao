require 'spec_helper'

describe Post do
  it 'should need a text' do
    Post.new(user: build(:user)).valid?.should be_false
  end

  it 'should need a user' do
    Post.new(text: 'foobar').valid?.should be_false
  end

  it 'should create new tags' do
    post = Post.new
    post.tag_list = 'foo, bar'
    tag_list = post.tags.map(&:name)
    tag_list.should include 'foo'
    tag_list.should include 'bar'
  end
end
