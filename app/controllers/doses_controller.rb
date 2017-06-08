class DosesController < ApplicationController

  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(params_dose)
    @dose.cocktail_id = params[:cocktail_id].to_i
    if @dose.save
      flash[:success] = "You have created succesfully a new dose"
      redirect_to @dose.cocktail
    else
      @cocktail = Cocktail.find(params[:cocktail_id])
      flash[:warning] = "You must supply a ingredient"
      redirect_to new_cocktail_dose_path
    end



  end

private

  def params_dose
    params.require(:dose).permit(:description,:ingredient_id)
  end


end
