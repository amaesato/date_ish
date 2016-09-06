class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_profile, except: [:index, :new, :create]

  def index
    @profiles = Profile.all
    if params[:search]
      @profiles = Profile.search(params[:search])
    else
      @profiles = Profile.all
    end
  end

  def show
    @user = @profile.user(params[:id])
  end

  def new
    @profile = current_user.profile.new
  end

  def create
    @profile = current_user.profile.new(profile_params)
    @profile.user_id = current_user.id
    if @profile.save
      redirect_to profile_path(@profile), success: 'You have successfully created an account!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @profile.user_id = current_user.id
    if @profile.update(profile_params)
      redirect_to profile_path(@profile), success: 'Profile successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to root_path, success: 'Profile deleted. Sorry to see you go.'
  end

  private

    def profile_params
      params.require(:profile).permit(:favorite_item, :favorite_swearword, :active, :bio, :image, :user_id, interests: [])
    end

    def find_profile
      @profile = Profile.find(params[:id])
    end
end
