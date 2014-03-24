require 'spec_helper'

describe ListItemsController do


  describe "GET 'new'" do
    it "returns http success" do
      get 'new', list_id: create(:list).id

      response.should be_success
      expect(assigns(:list_item).list_id).to_not be_nil
    end
  end

  describe "POST 'create'" do
    context "with valid attributes" do
      let(:list) {create(:list)}
      let(:valid_attributes) { {name: "Do the Dishes", list_id: list.id} }
      
      it "is a redirect" do
        post :create, item: valid_attributes
        expect(response.status).to redirect_to list_path(list)
      end
    
      it "changes item count by 1" do
        expect { post :create, list_item: valid_attributes }.to change(ListItem, :count).by(1)
      end
    
      it "sets a flash message" do
        post :create, list_item: valid_attributes
        expect(flash[:notice]).to_not be_blank
      end

      it "returns http success" do
        get 'create'
        response.should be_success
      end
    end
  
    context "with invalid attributes" do
      it "renders the new template" do
        post :create, list_item: {title: " "}
        expect(response).to render_template :new
      end
    end
    
    it "does not create a new item" do
      expect { post :create, list_item: {title: " "} }.to change(ListItem, :count).by(0)
    end
  end


  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe 'DELETE destroy' do

    before :each do
      @item = create(:list_item)
    end

    it "deletes the list_item" do
      expect{
        delete :destroy, id: @list_item.id
      }.to change(ListItem, :count).by(-1)
    end
  end

end
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

# end