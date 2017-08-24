class Images::ImagesSerializer < ActiveModel::Serializer
  attributes :id, :url, :product_id
end
