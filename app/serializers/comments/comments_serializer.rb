class Comments::CommentsSerializer < ActiveModel::Serializer
  attributes :id, :content, :created_at
  belongs_to :user, serializer: Users::UserCommentsSerializer
end
