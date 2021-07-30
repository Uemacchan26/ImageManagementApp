class SessionsController < ApplicationController
  def new
  end

  def create
    check_session
    redirect_to login_path, alert: @errors.join("\n") and return if @errors.present?

    user = User.find_by(id: params[:session][:id], password: params[:session][:password])
    redirect_to login_path, alert: "ユーザーIDとパスワードが一致するユーザーが存在しません" and return if user.blank?

    log_in user
    redirect_to images_index_path
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
