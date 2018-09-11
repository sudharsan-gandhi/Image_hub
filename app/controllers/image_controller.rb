require 'image'
class ImageController < ApplicationController
  include Image
  def upload
    begin
      image_param = params[:image]
      byebug
      image = Picture.new(image_param)
      image.save
      if Image::validate_type(image) && Image::validate_size(image) 
        render :json => {:output => "successfully saved the image"}
        return
      else
        image.delete if image
        render :json => {:error => "please try again later"}
        return
      end
    rescue
      image.delete if image
      render :json => {:error => "some technical problem"}
      return
    end if params[:image].present?
    image.delete if image
    render :json => {:error => "some technical problem"}
    return
  end

  def index
    begin
      files = Dir["./public/images/*.*"]
      render :json => {:output => files}
    rescue => exception
      render :json => {:error => exception}
    end
  end
end
