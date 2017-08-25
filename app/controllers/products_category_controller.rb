class ProductsCategoryController < ApplicationController
  def index
    category = params[:type]
    products = if category == 'Category'
                 Category.friendly.find(params[:category_id]).products.where(available: true)
               else
                 SubCategory.friendly.find(params[:category_id]).products.where(available: true)
               end
    render json: products, each_serializer: Products::ProductsSerializer
  end
end
