require 'spec_helper'

describe "devise/registrations/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new user form" do
    @view.should_receive(:resource).any_number_of_times.and_return(User.new)
    @view.should_receive(:resource_name).any_number_of_times.and_return('user')
    @view.should_receive(:devise_mapping).any_number_of_times.and_return(Devise.mappings[:user])
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_name[name=?]", "user[name]"
    end
  end
end
