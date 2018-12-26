json.id @user.id
json.data do
  json.profile do
    json.(@user, :name, :dob, :email)
    json.link "/users/#{@user.id}"
  end
end