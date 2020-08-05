class ReviewsController < ApplicationController
    before_action :set_profile

    def create
        @review = @profile.reviews.new(review_params)
        @review.user_id = current_user.id
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
