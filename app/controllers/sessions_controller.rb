class SessionsController < ApplicationController
  def new
  end

  def create
    check_session
    if @errors.present?
      flash[:errors] = @errors.join(",")
      redirect_to login_path and return
    end

    user = User.find_by(id: params[:session][:id], password: params[:session][:password])
    if user.blank?
      flash[:errors] = "ユーザーIDとパスワードが一致するユーザーが存在しません"
      redirect_to login_path and return
    end

    log_in user
    redirect_to images_path
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end

  private

  def check_session
    @errors = []
    @errors << "・ユーザーIDを入力してください" if params[:session][:id].blank?
    @errors << "・パスワードを入力してください" if params[:session][:password].blank?
  end
end
