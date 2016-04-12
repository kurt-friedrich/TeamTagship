class ShipsController < ApplicationController
  before_action :require_user, except: [:index]

  def index
    if current_user
      @user = current_user
      @ship = Ship.new
      @ships = Ship.timeline(@user).page(params[:page]).per(100)
    else
      redirect_to welcome_path
    end
  end

  def show
  end

  def new
    @ship = current_user.ships.new
    @user = User.find(params[:user_id])
  end

  def create
    @ship = current_user.ships.create(ship_params)

    respond_to do |format|
      if @ship.save
        format.html { redirect_to root_path, notice: 'ship was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def destroy
    @ship.destroy
    respond_to do |format|
      format.html { redirect_to user_ships_path, notice: 'Ship was successfully destroyed.' }
    end
  end

  private

  def ship_params
    params.require(:ship).permit(:body)
  end

end
