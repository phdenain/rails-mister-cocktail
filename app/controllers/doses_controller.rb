class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktails_path(@cocktail)
  end

  def destroy
  end

  private

  def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
  end

end
