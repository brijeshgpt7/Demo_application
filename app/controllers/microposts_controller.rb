class MicropostsController < ApplicationController
  
  def index
    @microposts = Micropost.all
  end

  
  def show
    @micropost = Micropost.find(params[:id])
  end

  
  def new
    @micropost = Micropost.new
  end

  
  def edit
    @micropost = Micropost.find(params[:id])
  end

  def create
    @micropost = Micropost.new(params[:micropost])

      if @micropost.save
        redirect_to @micropost        
      else
        render action: "new" 
      end
  end

  def update
    @micropost = Micropost.find(params[:id])
      if @micropost.update_attributes(params[:micropost])
       redirect_to @micropost
      else
       render action: "edit" 
      end
  end

   def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_to microposts_url 
  end
  
end
