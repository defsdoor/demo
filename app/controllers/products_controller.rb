class ProductsController < ApplicationController
  before_action :get_products, only: :index

  def index
  end

  private

  def get_products
    @products = Product.all.page(params[:page]).per(100)
    @products = @products.where("code LIKE :term OR name LIKE :term OR description LIKE :term", term: "%#{params[:search]}%") if params[:search]
  end
end
