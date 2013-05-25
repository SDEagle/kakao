module FeatureHelpers
  include Warden::Test::Helpers

  def self.included base
    Warden.test_mode!

    base.after :each do
      Warden.test_reset!
    end
  end

  def login user
    login_as user, scope: :user
  end

  def manual_login user, pw = 'verysecret'
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: pw
    click_button 'Login'
  end
end