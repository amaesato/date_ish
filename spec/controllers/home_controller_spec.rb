require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  login_user
      
  describe "GET #index" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      get :index
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "assigns all users as @user" do
      expect(assigns(:user)).to eq([@user])
    end
  end

end
