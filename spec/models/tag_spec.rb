require 'spec_helper'

describe Tag do
  it 'should reduce tag names' do
    Tag.reduce(' !,#foo,.:;').should == 'foo'
  end
end
