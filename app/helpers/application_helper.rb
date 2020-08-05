module ApplicationHelper

    def profile_photo(profile)
        if profile.photo.attached?
            profile.photo
        else
            image_url("user.png")
        end
    end

    def review_photo(review)
        if Profile.exists?(user_id: review)
            review.profile.photo
        else
            image_url("user.png")
        end
    end

end
