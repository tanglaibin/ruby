class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  extend ActiveSupport::Concern

  #ログイン必要
  before_action :authenticate_user!
  #ユーザー管理者のみ、アクセス可
  before_action -> { check_role_permission!(Const.role.user_admin) }

  layout "common"

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: { status: 'SUCCESS', message: 'loaded the post', data: @user }
    else
      render json: { status: 'ERROR', message: 'post not saved', data: @user.errors }
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: { status: 'SUCCESS', message: 'loaded the post', data: @user }
    else
      render json: { status: 'ERROR', message: 'post not saved', data: @user.errors }
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: "User was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email, :role_id)
  end
end
