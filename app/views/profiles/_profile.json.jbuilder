json.(user, :username)
json.following signed_in? ? current_user.following?(user) : false