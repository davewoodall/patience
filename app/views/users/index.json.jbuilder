json.array! @users do |comment|
  json.id comment.id
  json.data do
    json.profile do
      json.(comment, :name, :dob, :email)
    end
  end
end