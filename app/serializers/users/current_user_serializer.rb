class Users::CurrentUserSerializer < ActiveModel::Serializer
  attributes :username, :email, :name, :gender, :address, :description, :auth_token, :slug,
             :city, :district, :ward
end
