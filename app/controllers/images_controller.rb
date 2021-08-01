class ImagesController < ApplicationController
  include SessionsHelper
  before_action :logged_in_user, only: [:index, :new, :create]

  def index
    @images = Image.where(user_id: @current_user.id)
  end

  def new
  end

  def create
    errors = []
    title = file_upload_param[:title]
    uploaded_file = file_upload_param[:image_file]

    errors << "・タイトルを入力してください" if title.blank?
    errors << "・画像ファイルを入力してください" if uploaded_file.blank?
    errors << "・タイトルは30文字以下で入力してください" if title.length > 30

    if errors.present?
      flash[:errors] = errors.join(",")
      redirect_to action: :new and return
    end
    
    extname = File.extname(uploaded_file.original_filename)
    output_path = Rails.root.join('app/assets/images', title + extname)

    if Image.create(user_id: @current_user.id, title: title)
      File.open(output_path, 'w+b') do |f|
        f.write uploaded_file.read
      end
    end

    redirect_to action: :index
  end

  private

  def file_upload_param
    params.require(:image).permit(:title ,:image_file)
  end
end
