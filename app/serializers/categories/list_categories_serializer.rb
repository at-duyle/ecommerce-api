class Categories::ListCategoriesSerializer < ActiveModel::Serializer
  attributes :id, :name, :slug
  has_many :sub_categories, serializer: SubCategoriesSerializer
end
