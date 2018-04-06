class PhotosController < ApplicationController
  

   before_action :set_photo, :only => [:show, :edit, :update, :destroy]

  def index
    @photos = Photo.all;
  end

 
  #test new by index
  #def new
  #  @photos = Photo.all;
  #end


  def new
    @photo = Photo.new;
    #@photos = Photo.all; #test new action 
  end


  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to photos_url #like render :action => :index , but redirect_to will not keep data
    else
      render :new # same as >> render :action => :new  or >> render :template => "new"
      #render :action => :new  #redirect_to will not keep data, render will keep data
    end
  end

  # ================== #
  def show
    
  end

  def edit
    
  end
  # ================== #

  def update
  
    if @photo.update_attributes(photo_params)
      redirect_to photo_path(@photo)
    else
      render :action => :edit
     end   
  end




  def destroy
    @photo.destroy
    redirect_to photos_url
  end 
  # ================================== #
   
  private

  def photo_params
    params.require(:photo).permit(:title, :date, :description, :file_location)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
