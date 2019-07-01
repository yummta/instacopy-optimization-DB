class UserDecorator < SimpleDelegator
  def define_email
    if private_email
      "Private"
    else
      email
    end
  end

  def birthday_format
    birthday.strftime('%d - %m - %Y')
  end
end