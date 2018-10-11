class BlogsController < ApplicationController

before_action :move_index , except: [:index,:show]

def index
  @blogs=Blog.includes(:user).order("created_at DESC").page(params[:page]).per(5)
end

def new
  @blog=Blog.new
end

def create
  Blog.create(create_params)
end

def move_index
  redirect_to action: :index unless user_signed_in?
end

def destroy
  blog=Blog.find(params[:id])
  if current_user.id==blog.user_id
    blog.destroy
  end
end

def edit
@blog=Blog.find(params[:id])
end

def update
blog=Blog.find(params[:id])
  if current_user.id==blog.user_id
    blog.update(create_params)
  end
end

def show
@blogs=Blog.find(params[:id])
end

private

def blog_params
  params.permit(:text)
end

def create_params
  params.require(:blog).permit(:text).merge(user_id: current_user.id)
end

end
