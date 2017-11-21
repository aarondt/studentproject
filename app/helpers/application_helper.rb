module ApplicationHelper
    def gravatar_for(user, options = { size: 80})
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        size = options[:size]
        image_url =  GravatarImageTag::gravatar_url(user.email, :d => :identicon)
        #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(image_url, alt: user.profile.name, class: "img-circle")
    end
end
