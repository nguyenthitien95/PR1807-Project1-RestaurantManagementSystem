module UsersHelper
  def gravatar_for user, options = { size: 80 }
    size = options[:size]
    gravatar_url = "gravatar.jpg"
    image_tag gravatar_url, alt: user.name, width: size, height: size, class: "gravatar"
  end
end

