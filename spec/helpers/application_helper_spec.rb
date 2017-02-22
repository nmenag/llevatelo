require "rails_helper"

RSpec.describe ApplicationHelper, type: :helper do
  describe "generate_list(enum) method" do
    it "should return a array" do
      method = helper.generate_list(Article.offer_types)
      expect(method.class).to eq Array
      expect(method).to eq [["Regalo", "gift"], ["Necesito", "want"], ["Trueque", "barter"]]
    end
  end
end
