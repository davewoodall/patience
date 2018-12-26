class IdentificationsController < ApplicationController
  before_action :set_identification, only: [:show, :edit, :update, :destroy]

  def index
    @identifications = Identification.all
    respond_to do |format|
      format.html
      format.json { render json: @identifications, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @identification, status: :ok }
    end
  end

  def new
    @user = User.find(params[:user_id])
    @identification = Identification.new
  end

  def edit
  end

  def create
    @identification = Identification.new(user_identification_params)
    if @identification.save
      respond_to do |format|
        format.html { redirect_to user_path(@identification.user_id), notice: 'Identification was successfully created.' }
        format.json { render json: @identification, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @identification.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @identification.update(identification_params)
      respond_to do |format|
        format.html { redirect_to @identification, notice: 'Identification was successfully updated.' }
        format.json { render json: @identification, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @identification.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @identification.destroy
    respond_to do |format|
      format.html { redirect_to identifications_url, notice: 'Identification was successfully destroyed.' }
      format.json { render json: :nothing, status: 204 }
    end
  end

  private
    def set_identification
      set_user
      @identification = @user.identifications.last
    end

    def set_user
      user = if params.dig(:identification, :user_id)
        params[:identification][:user_id]
      else
        params[:id]
      end
      @user = User.find(user)
    end

    def identification_params
      params.require(:identification).permit(:user_id, :number, :issuer, :state, :expiration, :image_upload, { user_id: [ :id ] })
    end

    def user_identification_params
      user_id = params[:id] ? params[:id] : params[:user_id]
      identification_params.merge({user_id: user_id})
    end
end
