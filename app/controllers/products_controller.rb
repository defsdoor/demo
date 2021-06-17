class ProductsController < ApplicationController
  before_action :get_products, only: :index

  def index
      respond_to do |format|
        format.html
        format.json {
          render json: { entries: render_to_string(partial: 'product', collection: @products, formats: [:html]), nextPage: @products.next_page }
        }
      end
  end

  private

  def get_products
    @products = Product.all.page(params[:page]).per(100)
    @products = @products.where("code LIKE :term OR name LIKE :term OR description LIKE :term", term: "%#{params[:search]}%") if params[:search]
  end
end
