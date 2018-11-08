class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all
  end

  def create
    # dose_params = set_dose_params.merge(cocktail_id: params[:cocktail_id])
    cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(set_dose_params)
    @dose.cocktail_id = cocktail.id
    @dose.save
    # cocktail.doses.new(set_dose_params)
    redirect_to cocktail_path(cocktail)
  end

  def destroy
  end

  private

  def set_dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
