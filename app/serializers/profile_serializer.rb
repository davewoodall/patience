class ProfileSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :dob
end
