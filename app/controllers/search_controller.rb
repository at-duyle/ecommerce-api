class SearchController < ApplicationController
  def index
    products = Product.includes(:images).where('LOWER(name) like ?', "%#{params[:q].downcase}%")
    if !products.blank?
      render json: products, each_serializer: Products::ProductsSerializer
    else
      error = { errors: "No results found for '#{params[:q]}'" }
      render json: error
    end
  end
end
