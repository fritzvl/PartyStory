require 'spec_helper'

describe "phrases/index.html.haml" do
  before(:each) do
    assign(:phrases, [
      stub_model(Phrase),
      stub_model(Phrase)
    ])
  end

  it "renders a list of phrases" do
    render
  end
end
