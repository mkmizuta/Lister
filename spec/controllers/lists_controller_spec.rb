require 'spec_helper'

describe ListsController do
    let(:list) { create(:list) }
    let(:user) { create(:user) }

  describe "GET 'new'" do
    it "is successful" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST 'create'" do
    context "with valid attributes" do
      let(:valid_attributes) {{ name: "Restaurants to indulge at", user_id: "1" }}
      before(:each) do
        request.session[:user_id] = user.id
      end
    
      it "changes list count by 1" do 
        expect { post :create, list: valid_attributes }.to change(List, :count).by(1)
      end
    
      it "sets a flash message" do
        post :create, list: valid_attributes
        expect(flash[:notice]).to_not be_blank
      end
    end
  
    context "with invalid attributes" do
      it "renders the new template" do
        request.session[:user_id] = user.id

        post :create, list: {name: nil}
        expect(response).to redirect_to "/lists/new?notice=Your+list+failed+to+save."
      end
    
      it "does not create a list" do
        request.session[:user_id] = user.id
        expect { post :create, list: {name: nil} }.to change(List, :count).by(0)
      end
    end
  end

  describe "GET 'show'" do
    let(:list) { create(:list) }
    
    it "is successful" do
      get :show, id: list.id
      expect(response).to be_successful
    end
  end
end