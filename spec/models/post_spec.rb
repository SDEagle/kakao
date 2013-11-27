require 'spec_helper'

describe Post do
  it 'needs text' do
    Post.new(user: build(:user)).valid?.should be_false
  end

  it 'needs an author' do
    Post.new(text: 'foobar').valid?.should be_false
  end

  describe '#receiver_ids=' do
    it 'delegates to the different types' do
      p = Post.new
      expect(p).to receive(:user_receiver_ids=).with([5])
      expect(p).to receive(:group_receiver_ids=).with([42])
      p.receiver_ids = [{'type' => 'User', 'id' => 5}, {'type' => 'Group', 'id' => 42}]
    end

  end

  describe '#serialized_receiver_ids' do
    it 'calls #receiver_ids= with the deserialized param' do
      p = Post.new
      expect(p).to receive(:receiver_ids=).with([{'type' => 'User', 'id' => 5}])
      p.serialized_receiver_ids = '[{"type": "User", "id": 5}]'
    end
  end
end
