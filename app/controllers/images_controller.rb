class ImagesController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]

  def index
    @images = Image.where(user_id: current_user.id)
  end
end
