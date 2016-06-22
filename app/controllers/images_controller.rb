class ImagesController < ApplicationController
  def show
  end

  def new
    @image = Image.new
  end

  def create
      if params[:image].present?
        @image = Image.new(image_params)
        file = params[:image][:picture]
        File.open(Rails.root.join('app','assets', 'images', current_user.login+'.jpg' ), 'wb') do |f|
          f.write(file.read)
        end
        redirect_to root_path
      else
        render 'images/new'
      end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:name)
    end
end
