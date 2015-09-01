json.array!(@users) do |user|
  json.extract! user, :id, :username, :password, :firstname, :lastname, :email, :email_enabled, :phone_number
  json.url user_url(user, format: :json)
end
