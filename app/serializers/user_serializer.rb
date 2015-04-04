class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :role, :auth_token, :auth_token_flag, :created_at, :updated_at
end
