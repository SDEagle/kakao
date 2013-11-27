require 'spec_helper'

describe SearchController do
  let(:current_user) { create :user, name: 'Arthur' }
  before(:each) { sign_in current_user }

  it 'responds with matched users' do
    marvin = create :user, name: 'Marvin'
    create :user, name: 'Zaphod'

    get 'index', query: 'marv', format: :json
    assigns(:results).should =~ [marvin]
  end
end
