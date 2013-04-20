require 'spec_helper'

describe ApplicationHelper do
  it 'should translate stuff with model name' do
    translate_with_model('flash.success.create', User).should == t('flash.success.create', model: 'User')
  end

  it 'should translate stuff with plural model name' do
    translate_with_model('flash.success.create', User, true).should == t('flash.success.create', model: 'Users')
  end

  it 'should alias tm for translate with model' do
    tm('flash.success.create', User, true).should == t('flash.success.create', model: 'Users')
  end
end