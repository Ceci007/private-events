module ApplicationHelper
  def gravatar_image_tag(user, options = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.name)
  end

  def displaylist(list)
    var = content_tag(:div) do
    end

    list.each do |event|
      var +=
        content_tag(:div, class: 'w-100 col-3') do
          content_tag(:div) do
            link_to image_tag('event.jpeg', alt: 'Logo', class: 'w-100'), event
          end +
            content_tag(:p) do
              "#{event.title} #{event.date}"
            end
        end
    end

    var
  end

  def displaylist_user(list)
    var = content_tag(:div) do
    end

    list.each do |user|
      var +=
        content_tag(:div, class: 'w-100 col-2') do
          content_tag(:div) do
            link_to gravatar_image_tag(user, size: 200), user
          end +
            content_tag(:p) do
              user.username.to_s
            end
        end
    end

    var
  end
end
