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

  def check_quantity
    product = Product.friendly.find(params[:id])
    if product.quantity.equal? 0
      product.message = "#{product.name} are out of stock"
    elsif product.quantity < params[:quantity].to_i
      product.message = "#{product.name} have only #{product.quantity} product(s)"
    else
      product.message = 'Available'
      render json: product, serializer: Products::ProductCartSerializer
    end
  end
end
