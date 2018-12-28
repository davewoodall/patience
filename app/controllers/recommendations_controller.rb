class RecommendationsController < ApplicationController
  before_action :set_recommendation, only: [:show, :edit, :update, :destroy]

  def index
    @recommendations = Recommendation.all
    respond_to do |format|
      format.html
      format.json { render json: @recommendations, status: :ok }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @recommendation, status: :ok }
    end
  end

  def new
    @user = User.find(params[:id])
    @recommendation = Recommendation.new
  end

  def edit
  end

  def create
    @recommendation = Recommendation.new(user_recommendation_params)
    if @recommendation.save
      respond_to do |format|
        format.html { redirect_to user_path(@recommendation.user_id), notice: 'Recommendation was successfully created.' }
        format.json { render json: @recommendation, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @recommendation.update(recommendation_params)
      respond_to do |format|
        format.html { redirect_to user_path(@recommendation.user_id), notice: 'Recommendation was successfully updated.' }
        format.json { render json: @recommendation, status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: @recommendation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recommendation.destroy
    respond_to do |format|
      format.html { redirect_to user_path(@recommendation.user_id), notice: 'Recommendation was successfully destroyed.' }
      format.json { render json: :nothing, status: 204 }
    end
  end

  private
    def set_recommendation
      set_user
      @recommendation = @user.recommendations.last
    end

    def set_user
      user = if params.dig(:recommendation, :user_id)
        params[:recommendation][:user_id]
      else
        params[:id]
      end
      @user = User.find(user)
    end

    def recommendation_params
      params.require(:recommendation).permit(:user_id, :number, :issuer, :state, :expiration, :image_upload, { user_id: [ :id ] })
    end

    def user_recommendation_params
      user_id = params[:id] ? params[:id] : params[:user_id]
      recommendation_params.merge({user_id: user_id})
    end
end
