module ApplicationHelper
  def display_propper_flash
    if flash[:alert]
      content_tag(:div, flash[:alert], id: 'notice_alert', align: 'center')
    elsif flash[:notice]
      content_tag(:div, flash[:notice], id: 'notice', align: 'center')
    elsif flash[:danger]
      content_tag(:div, flash[:danger], id: 'notice_alert', align: 'center')
    end
  end
 
  def login_helper
   content_tag(:div, class: 'navbar navbar-expand-lg navbar-light bg-light') do
      content_tag(:div) do
        link_to 'Private Events', root_path, class: 'navbar-brand'
      end +

      content_tag(:div, class: "collapse navbar-collapse") do 
          content_tag(:div, class: "navbar-nav mr-auto") do
            if current_user?
              content_tag(:div, class: "nav-item") do
                link_to current_user.name, current_user, class: 'nav-link'
            end +
              content_tag(:div, class: "nav-item") do
              link_to 'New Event', new_event_path, class: 'nav-link'
            end +
              content_tag(:div, class: "nav-item") do
              link_to 'All Events', events_path, class: 'nav-link'
            end +
              content_tag(:div, class: "nav-item") do
              link_to 'Logout', logout_path, class: 'nav-link'
            end
            else
              content_tag(:div, class: "nav-item") do
                link_to 'Register', new_user_path, class: 'nav-link'
              end +
                content_tag(:div, class: "nav-item") do
                  link_to 'Login', login_path, class: 'nav-link'
              end
            end
          end
        end
      end
   end
end
