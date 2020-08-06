module ApplicationHelper

    def profile_photo(profile)
        if profile.photo.attached?
            profile.photo
        else
            image_url("user.png")
        end
    end

    def review_photo(review)
        if Profile.exists?(user_id: review.user_id)
            review.user.profile.photo
        else
            image_url("user.png")
        end
    end

    def review_name(review)
        if Profile.exists?(user_id: review.user_id)
            review.user.profile.name
        else
            review.user.email
        end
    end

    def photographer
        if Profile.exists?(user_id: current_user.id)
            return true
        end
    end

    def current_photographer(model)
        if Profile.exists?(user_id: current_user.id)
            if model.id == current_user.profile.id
                return true
            else
                return false
            end
        end
    end
end
