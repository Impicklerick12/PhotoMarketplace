class ListingsController < ApplicationController

  # pagy gem for dividing listings across multiple pages.
  include Pagy::Backend

  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @pagy, @listings = pagy(Listing.all, items: 10)
  end

  def show
    # eager loading, only calling for the listing with the id from params, and including the categories
    @listing = Listing.includes(:category).find(params[:id])
  end

  def new
    # verifications to check whether user has created a profile first, before creating a listing
    if current_user.profile == nil
      redirect_to new_profile_path, notice: 'You need to create a profile first!'
    else
      @categories = Category.all
      @listing = Listing.new
    end
  end

  def edit
    # verifications to check whether user has a profile created
    # also check whether the listing was created by the current user before they can edit it
    if Profile.exists?(user_id: current_user.id)
      if current_user.profile.id != @listing.profile_id
        redirect_to profiles_path
      end
    else
      redirect_to profiles_path
    end
  end

  def create
    # assigning the listing profile id to the current users profile id
    @listing = Listing.new(listing_params)
    @listing.profile_id = current_user.profile.id

    respond_to do |format|
      if @listing.save
        format.html { redirect_to profile_path(@listing.profile_id), notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to profile_path(@listing.profile_id), notice: 'Listing was successfully updated.' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to profile_path(@listing.profile.id), notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :description, :price, :profile_id, :category_id)
    end
end
