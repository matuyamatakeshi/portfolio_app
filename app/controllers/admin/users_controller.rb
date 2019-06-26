class Admin::UsersController < ApplicationController

  skip_before_action :login_required
  before_action :target_user, only: %i[show edit update destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path, notice: "#{@user.name}さん登録ありがとうございます！"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "#{@user.name}さんのデータを更新しました！"
    else
      render :edit
    end
  end

  def show
  end

  def index
  end

  def destroy
    @user.destroy
    redirect_to new_admin_user_path, notice: "#{@user.name}さんのデータを削除しました"
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail, :admin, :password, :password_confirmation)
  end

  def target_user
    @user = User.find(params[:id])
  end
end
