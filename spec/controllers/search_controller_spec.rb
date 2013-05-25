require 'spec_helper'

describe SearchController do

  it 'should not be accessible if not logged in' do
    get :tags
    response.should redirect_to(new_user_session_path)
  end

  describe "GET 'tags'" do
    it "returns matched tags" do
      sign_in create :user
      discussion = Tag.create!(name: 'discussion')
      Tag.create!(name: 'nerdstuff')
      get 'tags', query: 'dis', format: 'json'
      assigns(:tags).should == [discussion]
    end
  end

end
