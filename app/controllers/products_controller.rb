class ProductsController < ApplicationController
  def index
    products = Product.includes(:images).where(available: true)
    render json: products, each_serializer: Products::ProductsSerializer
  end

  def show
    product = Product.friendly.includes(comments: :user).find(params[:id])
    render json: product, serializer: Products::ShowProductSerializer
  rescue
    error = { errors: 'Data not found' }
    render json: error, status: 404
  end
end
