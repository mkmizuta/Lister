require 'spec_helper'

describe "List_item" do
  let(:list_item) { create(:list_item) }
  describe "validates" do
    it "is valid" do
      expect(list_item).to be_valid
    end
    
    it "to_do presence" do
      list_item.update(to_do: nil)
      expect(list_item).to be_invalid
    end
  end
end