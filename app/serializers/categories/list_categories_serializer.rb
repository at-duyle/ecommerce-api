class Categories::ListCategoriesSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :sub_categories, serializer: SubCategoriesSerializer
end
