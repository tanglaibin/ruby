class ApplsController < ApplicationController
  before_action :set_appl, only: [:show, :edit, :update, :destroy]

  layout "common"

  # GET /appls
  def index
    @appls = Appl.all
  end

  # GET /appls/1
  def show
  end

  # GET /appls/new
  def new
    @appl = Appl.new
  end

  # GET /appls/1/edit
  def edit
  end

  # POST /appls
  def create
    @appl = Appl.new(appl_params)

    if @appl.save
      # redirect_to @appl, notice: "Appl was successfully created."
      render json: { status: 'SUCCESS', message: 'loaded the post', data: @appl }
    else
      # render :new
      render json: { status: 'ERROR', message: 'post not saved', data: @appl.errors }
    end
  end

  # PATCH/PUT /appls/1
  def update
    if @appl.update(appl_params)
      render json: { status: 'SUCCESS', message: 'loaded the post', data: @appl }
    else
      ender json: { status: 'ERROR', message: 'post not saved', data: @appl.errors }
    end
  end

  # DELETE /appls/1
  def destroy
    @appl.destroy
    redirect_to appls_url, notice: "Appl was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_appl
    @appl = Appl.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def appl_params
    params.require(:appl).permit(:user_id, :title, :state, :description, :checked)
  end
end
