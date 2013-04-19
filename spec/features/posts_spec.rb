require 'spec_helper'

describe 'Posts' do
  before :each do
    @user = create :user
  end

  describe 'GET /posts' do
    it 'should display posts' do
      login @user
      Post.create(user: @user, text: 'foo')
      visit posts_path
      page.should have_content 'foo'
    end
  end

  describe 'POST /posts' do
    it 'should display added tags' do
      login @user
      visit new_post_path
      fill_in 'Text', with: 'foo'
      fill_in 'Tags', with: 'bar, nothing'
      click_link 'Create'
      page.should have_content 'foo'
      page.should have_content 'bar'
      page.should have_content 'nothing'
    end
  end
end
