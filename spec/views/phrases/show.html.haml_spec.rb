require 'spec_helper'

describe "phrases/show.html.haml" do
  before(:each) do
    @phrase = assign(:phrase, stub_model(Phrase))
  end

  it "renders attributes in <p>" do
    render
  end
end
