require 'spec_helper'

describe ListItemsController do
  #   let(:list) { create(:list) }
  #   let(:list_item) { create(:list_item) }
  #   let(:user) { create(:user) }


  # describe "POST 'create'" do
  #   context "with valid attributes" do
  #     let(:valid_attributes) {{ to_do: "feed cat", list_id: "1"  }}
  #     before(:each) do
  #       request.session[:user_id] = user.id
  #     end
    
  #     it "is successful" do
  #       post :create, list_item: valid_attributes
  #       expect(response).to be_successful
  #     end

  #     it "changes list_item count by 1" do 
  #       expect { post :create, list_item: valid_attributes }.to change(ListItem, :count).by(1)
  #     end
    
  #     it "sets a flash message" do
  #       post :create, list_item: valid_attributes
  #       expect(flash[:notice]).to_not be_blank
  #     end
  #   end
  
  #   context "with invalid attributes" do
  #     it "renders the new template" do
  #       request.session[:user_id] = user.id

  #       post :create, list: {list_item: nil}
  #       expect(response).to render_template :new
  #     end
    
  #     it "does not create a list" do
  #       request.session[:user_id] = user.id
  #       expect { post :create, list_item: {to_do: nil} }.to change(ListItem, :count).by(0)
  #     end
  #   end
  # end

end