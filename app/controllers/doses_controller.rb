class DosesController < ApplicationController
  before_action :set_cocktail, except: :destroy

  def show
    @dose = Dose.find(params[:id])
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail_id = @cocktail.id
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    # redirect_to cocktail_path(@cocktail)
    redirect_to @dose.cocktail
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
