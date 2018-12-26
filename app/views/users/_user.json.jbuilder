json.id @user.id
json.data do
  json.profile do
    json.(@user, :name, :dob, :email)
    json.link "/users/#{@user.id}"
  end

if @user.recommendations.present?
    json.recommendation do
      json.(@user.recommendations.last,
        :id,
        :state,
        :issuer,
        :expiration,
        :number)
      json.expired @user.recommendations.last.is_expired?
      json.image_url url_for(@recommendation_image)
    end
  end

  if @user.identifications.present?
    json.identification do
      json.(@user.identifications.last,
        :id,
        :state,
        :expiration,
        :number)
      json.expired @user.identifications.last.is_expired?
      json.image_url url_for(@identification_image)
    end
  end
end