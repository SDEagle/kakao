require 'spec_helper'

describe User do
  it 'should need a name' do
    User.new(email: 'a@b.com', password: 'abcdefgh').valid?.should be_false
  end
end
