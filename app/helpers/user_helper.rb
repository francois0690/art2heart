module UserHelper
  def profile_image(user)
    if user.avatar.attached?
      cl_image_tag user.avatar.key
    else
      image_tag "placeholder.jpg"
    end
  end
end
