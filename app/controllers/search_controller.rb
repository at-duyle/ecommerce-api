class SearchController < ApplicationController
  def index
    products = Product.where('name like ?', "%#{params[:q]}%")
    if !products.blank?
      render json: products, each_serializer: Products::ProductsSerializer
    else
      error = { errors: "No results found for '#{params[:q]}'" }
      render json: error
    end
  end
end
