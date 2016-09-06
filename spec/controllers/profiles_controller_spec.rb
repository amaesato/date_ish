require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
  login_user

  let(:valid_attributes) {
    { favorite_item: 'bed', favorite_swearword: 'swear', active: '', interests: 'art' }
  }

  let(:invalid_attributes) {
    { favorite_item: '', favorite_swearword: 'swear', active: '', interests: 'art' }
  }


  # describe "GET #index" do
  #   before(:each) do
  #     @profile = FactoryGirl.create(:profile, user: subject.current_user)
  #     get :index
  #   end
  #
  #   it "returns http success" do
  #     get :index
  #     expect(response).to have_http_status(:success)
  #   end
  #
  # end

  describe "GET #show" do
    before(:each) do
      @profile = FactoryGirl.create(:profile, user: subject.current_user)
      get :show, params: {id: @profile.id}
    end

    it "should have a current_user" do
      # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(subject.current_user).to_not eq(nil)
    end

    it "assigns the requested profile as @profile" do
      expect(assigns(:profile)).to eq(@profile)
    end

    it "returns http success" do
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    before(:each) do
      get :new
    end

    it "assigns a new profile as @profile" do
      expect(assigns(:profile)).to be_a_new(Profile)
    end

    it "returns the new template" do
      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    before(:each) do
      @profile = FactoryGirl.create(:profile, user: subject.current_user)
      get :edit, params: {id: @profile.id}
    end

    it "assigns the requested profile car as @profile" do
      expect(assigns(:profile)).to eq(@profile)
    end

    it "renders the edit template" do
      expect(response).to render_template(:edit)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      before(:each) do
        post :create, params: {profile: valid_attributes}
      end

      it "creates a new profile" do
        expect(assigns(:profile)).to change(Profile.count).by(1)
      end
    end
  end

end
