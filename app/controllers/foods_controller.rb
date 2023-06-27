class FoodsController < ApplicationController
  def index
    @user = current_user
    @foods = @user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      flash[:success] = 'Food added!'
      redirect_to foods_path
    else
      render 'new'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:success] = 'Food deleted'
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
