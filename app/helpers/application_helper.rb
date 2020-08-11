module ApplicationHelper

    # page gem that allows the division of elements across multiple pages to reduce loading
    include Pagy::Frontend
    
    # helper method to find whether the user has a profile photo attached
    # if not, assign the 'stock' profile image
    def profile_photo(profile)
        if profile.photo.attached?
            profile.photo
        else
            image_url("user.png")
        end
    end

    # helper method to firstly find whether a profile exists for the reviews user
    # if they have a profile, use their profile photo as their review photo
    # if not, assign the 'stock' profile image
    def review_photo(review)
        if Profile.exists?(user_id: review.user_id)
            review.user.profile.photo
        else
            image_url("user.png")
        end
    end

    # helper method to firstly find whether a profile exists for the reviews user
    # if they do have a profile, use their profile name as their review name
    # else use their user email for their review
    def review_name(review)
        if Profile.exists?(user_id: review.user_id)
            review.user.profile.name
        else
            review.user.email
        end
    end

    # helper method to return true if a profile exists for the current user
    def photographer
        if Profile.exists?(user_id: current_user.id)
            return true
        end
    end

    # helper method to firstly find whether a profile exists for the current user
    # if they do have a profile, and their profile id is equal to the listing profle id, return true
    # else return false
    def current_photographer_listing(model)
        if Profile.exists?(user_id: current_user.id)
            if model.profile.id == current_user.profile.id
                return true
            else
                return false
            end
        end
    end

    # helper method to firstly find whether a profile exists for the current user
    # if they do have a profile, and their user profile id is equal to the profle id, return true
    # else return false
    def current_photographer_profile(model)
        if Profile.exists?(user_id: current_user.id)
            if model.id == current_user.profile.id
                return true
            else
                return false
            end
        end
    end
end

