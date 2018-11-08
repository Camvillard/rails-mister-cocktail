class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.all.order(:name)
  end

  def create
    cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(set_dose_params)
    @dose.cocktail_id = cocktail.id
    @dose.save
    if @dose.save
      redirect_to cocktail_path(cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id]).delete
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
