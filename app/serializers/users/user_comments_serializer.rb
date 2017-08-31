class Users::UserCommentsSerializer < ActiveModel::Serializer
  attributes :username, :created_at
end
