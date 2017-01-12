require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PagesHelper. For example:
#
# describe PagesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PagesHelper, type: :helper do
  describe "generate_list(enum) method" do
    it "should return a array" do
      enum = {"gift"=> 0, "want"=> 1, "barter"=> 2}
      method = helper.generate_list(Article.types)
      expect(method.class).to eq Array
      expect(method).to eq [['gift', 'gift'],['want', 'want'],['barter', 'barter']]
    end
  end
end
