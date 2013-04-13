require 'spec_helper'

describe "posts/edit" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :text => "MyText",
      :user => nil
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do
      assert_select "textarea#post_text[name=?]", "post[text]"
    end
  end
end
