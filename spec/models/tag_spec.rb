require 'spec_helper'

describe Tag do
  it 'needs a name' do
    Tag.new(name: '').valid?.should be_false
  end
end
