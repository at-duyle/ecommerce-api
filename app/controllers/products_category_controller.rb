class ProductsCategoryController < ApplicationController
  def index
    products = Product.where(categorical_id: params[:category_id], categorical_type: params[:type], available: true)
    render json: products, each_serializer: Products::ProductsSerializer
  end
end
