require 'spec_helper'

describe Post do
  it 'should need a text' do
    Post.new(user: build(:user)).valid?.should be_false
  end

  it 'should need a user' do
    Post.new(text: 'foobar').valid?.should be_false
  end
end
