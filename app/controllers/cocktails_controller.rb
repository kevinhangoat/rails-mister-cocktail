class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @ingredient = @search["ingredient"]
      @cocktails = Cocktail.where(name: @name) || Dose.where(ingredient: @ingredient).each { |d| d.cocktail}
    end
  end

  def new
    @cocktail = Cocktail.new
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def create
    @cocktail = Cocktail.new(cocktailparams)
    @cocktail.save
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to root_path
  end

  private

  def cocktailparams
    params.require(:cocktail).permit(:name, :photo)
  end
end
