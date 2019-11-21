class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    raise
  end

  def new
    @cocktail = Cocktail.new
    @ingredients = @cocktail.ingredients
  end

  def create
    @cocktail = Cocktail.new(set_cocktail_params).save
    redirect_to cocktails_path
  end

  private

  def set_cocktail_params
    params.require(:cocktail).permit(:name, :ingredient_id, :directions, :image)
  end

end
