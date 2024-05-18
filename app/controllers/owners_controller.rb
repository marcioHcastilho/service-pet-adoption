class OwnersController < ApplicationController
  def index
    @owners = Owner.includes(:pets).all
    render json: @owners.to_json(include: { pets: { only: [:id, :name, :pet_type, :breed, :weight] } })
  end

  def show
    @owner = Owner.includes(:pets).find(params[:id])
    render json: @owner.to_json(include: { pets: { only: [:id, :name, :pet_type, :breed, :weight] } })
  end

  def create
    @owner = Owner.new(owner_params)

    if @owner.save
      render json: @owner, status: :created
    else
      render json: @owner.errors, status: :unprocessable_entity
    end
  end

  def update
    if @owner.update(owner_params)
      render json: @owner
    else
      render json: @owner.errors, status: :unprocessable_entity
    end
  end

  private


  def owner_params
    params.require(:owner).permit(:name, :email, :phone)
  end
end
