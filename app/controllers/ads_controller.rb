class AdsController < ApplicationController
  before_action :authenticate_user!, only: [:show,:new, :create]  

  def show
   @ad = Ad.find(params[:id])
  end
  
  def new
     if current_user.profile.nil?
       redirect_to new_profile_path, notice: 'Conclua seu cadastro para anunciar'
     else
       @ad = Ad.new
       @product = Product.all
     end
   end

  def create
   @ad = Ad.new(ad_params)
   @ad.save
   redirect_to ad_path(@ad)    
  end

  private 

   def ad_params
     params.require(:ad)
           .permit(:title, :description, :price, :status, :product_category_id, images: [])
           .merge(profile_id: current_user.profile_id)
   end
end