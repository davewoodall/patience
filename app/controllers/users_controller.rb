class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    respond_to :html, :json
  end

  def show
    @image = recommendation_image
    respond_to :html, :json
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    user = user_params.except(:recommendation_attributes)
    @user = User.new(user)

    if @user.save
      if user_params.dig(:recommendation_attributes)
        @user.recommendations.create(user_params[:recommendation_attributes])
      end
      respond_to do |format|
        format.html
        format.json { render 'create', status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @user.update(user_params)
      respond_to do |format|
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { render json: :nothing, status: 204 }
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :name, :email, :dob,
      recommendation_attributes: [
        :number, :issuer, :state, :expiration, :id
      ])
  end

  def recommendation_image
    @user.recommendations.try(:last).try(:image_upload)
  end
end
