class DishesController < ApplicationController
  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new dish_params
    if @dish.save
      flash[:info] = "create new dish successul"
      redirect_to @dish
    else
      render "new"
    end
  end

  def edit
    @dish = Dish.find params[:id]
  end

  def update
    @dish = Dish.find params[:id]
    if @dish.update_attributes dish_params
      flash[:success] = "update success"
      redirect_to @dish
    else
      render "edit"
    end
  end

  def show
    @dish = Dish.find params[:id]
  end

  def index
    @dishes = Dish.paginate page: params[:page], per_page: 12
  end

  private
  def dish_params
    params.require(:dish).permit :name, :image, :description, :status,
      :promotion, :price, :category_id
  end
end
