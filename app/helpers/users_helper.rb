module UsersHelper
  def fullname(user)
    "#{user.first_name} #{user.last_name}"
  end

  def users_list(list)
    content_tag :ul do
      list.collect do |user|
        concat content_tag :li, link_to(fullname(user), user)
      end
    end
  end
end
