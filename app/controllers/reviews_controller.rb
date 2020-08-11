class ReviewsController < ApplicationController

    # ensuring that the current profile id is set and saved in the @profile variable
    before_action :set_profile

    def create
        @review = @profile.reviews.new(review_params)
        # assigning the reviews user_id to the current users id
        @review.user_id = current_user.id
        # assigning the reviews user_id to the current users id
        @review.profile_id = @profile.id
        @review.save
        redirect_back(fallback_location: root_path)
    end

    def destroy

    end

    private
    def review_params
        params.require(:review).permit(:review, :profile_id)
    end
    
    def set_profile
        @profile = Profile.find(params[:profile_id])
    end
end
