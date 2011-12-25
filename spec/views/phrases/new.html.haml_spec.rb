require 'spec_helper'

describe "phrases/new.html.haml" do
  before(:each) do
    assign(:phrase, stub_model(Phrase).as_new_record)
  end

  it "renders new phrase form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => phrases_path, :method => "post" do
    end
  end
end
