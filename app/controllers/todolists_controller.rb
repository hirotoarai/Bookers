class TodolistsController < ApplicationController
  def new
    @blog = Blog.new
  end
  
  def create
    blog = Blog.new(blog_params)
    blog.save
    redirect_to '/top'
  end
  
  def index
    @blogs = Blog.all
    
    if params[:id].present?
      set_blog
    else
      @blog = Blog.new
    end
  end
  
  def show
    @blogs = Blog.find(params[:id])
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end
  
  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog.id)
  end
  
  def destroy
    list = Blog.find(params[:id]) 
    list.destroy
    redirect_to todolists_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :body)
  end
  
end
