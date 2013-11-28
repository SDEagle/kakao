require 'spec_helper'

describe Post do
  it 'needs text' do
    Post.new(user: build(:user)).valid?.should be_false
  end

  it 'needs an author' do
    Post.new(text: 'foobar').valid?.should be_false
  end

  describe '#recipient_ids=' do
    it 'delegates to the different types' do
      p = Post.new
      expect(p).to receive(:user_recipient_ids=).with([5])
      expect(p).to receive(:group_recipient_ids=).with([42])
      p.recipient_ids = [{'type' => 'User', 'id' => 5}, {'type' => 'Group', 'id' => 42}]
    end

  end

  describe '#serialized_recipient_ids' do
    it 'calls #recipient_ids= with the deserialized param' do
      p = Post.new
      expect(p).to receive(:recipient_ids=).with([{'type' => 'User', 'id' => 5}])
      p.serialized_recipient_ids = '[{"type": "User", "id": 5}]'
    end
  end
end
