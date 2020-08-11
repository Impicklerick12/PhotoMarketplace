class ProfilesController < ApplicationController
  
  #page gem for diving profiles across multiple pages
  include Pagy::Backend

  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:home, :how_this_works]

  def home
    # eager loading variables for the home page. limiting the database calls

    @home_profiles = Profile.order("created_at ASC").limit(3)
    @home_categories = Category.order("RANDOM()").limit(5)
  end

  def index
    @pagy, @profiles = pagy(Profile.all.with_attached_photo.order("created_at ASC"), items: 12)
  end

  def show
    # eager loading, only calling for the profile from the params id, and including the associated listings and reviews
    @profile = Profile.includes(:listings, :reviews).find(params[:id])
    @review = Review.new
    # @reviews = @profile.reviews
  end

  def new
    # verifications to check whether user has already created a profile
    # if they have, redirect back with the error message
    if Profile.exists?(user_id: current_user.id)
      redirect_to profile_path(current_user.profile.id), notice: 'You already have a profile created!'
    else
      @profile = Profile.new
    end
  end

  def edit
    # verifications to check whether user has a profile created
    # also check whether the profile was created by the current user before they can edit it
    if Profile.exists?(user_id: current_user.id)
      if current_user.id != @profile.user_id
        redirect_to profiles_path
      end
    else
      redirect_to profiles_path
    end
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id

    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def how_this_works
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      params.require(:profile).permit(:name, :description, :user_id, :photo, :instagram, :website)
    end
end
