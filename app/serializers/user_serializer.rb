class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :created_at
end
