module UserHelper
  def profile_image(user, opts = {})
    if user.avatar.attached?
      cl_image_tag user.avatar.key, opts
    else
      image_tag "placeholder.jpg", opts
    end
  end
end
