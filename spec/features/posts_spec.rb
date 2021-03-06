require 'spec_helper'

describe 'Posts' do
  before :each do
    @user = create :user
  end

  describe 'GET /posts' do
    it 'should display posts' do
      login @user
      Post.create(user: @user, text: 'foo')
      login create(:user)
      visit posts_path
      page.should have_content 'foo'
      page.should have_content @user.name
    end

    it 'should filter posts by tag' do
      create :post, text: 'sinnvoll', tags: [Tag.create!(name: 'text')]
      create :post, text: 'sinnlos', tags: [Tag.create!(name: 'sinnlos')]
      login @user
      visit posts_path
      click_link '#text'
      page.should have_content 'sinnvoll'
      page.should_not have_content 'sinnlos'
    end
  end

  describe 'POST /posts' do
    it 'should display added tags' do
      login @user
      visit new_post_path
      fill_in 'Text', with: 'foo #bar #nothing'
      click_on 'Create Post'
      page.should have_content 'foo'
      page.should have_link '#bar'
      page.should have_link '#nothing'
    end
  end
end
