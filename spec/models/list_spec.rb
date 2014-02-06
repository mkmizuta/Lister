require 'spec_helper'

describe List do
  let(:list) { create(:list) }

  describe "validates" do
    it "is valid" do
      expect(list).to be_valid
    end
    
    it "name presence" do
      list.update(name: nil)
      expect(list).to be_invalid
    end

    it "name is unique" do
      list2 = build(:list, name: list.name)
      list2.valid?
      expect(list2.errors[:name]).to include "has already been taken"
    end

    it "user_id presence" do
      list.update(user_id: nil)
      expect(list).to be_invalid
    end

    it "belongs to a user" do
      list.update(user_id: nil)
      expect(list).to be_invalid
    end

    it "name has at least 2 characters" do
      list = build(:list, name: "A")
      list.valid?
      expect(list.errors[:name]).to include "must be at least 2 characters"
    end
  end
end
