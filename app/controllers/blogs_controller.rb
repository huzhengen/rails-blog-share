class BlogsController < ApplicationController
  before_action :must_sign_in

  def create
    @blog = Blog.new(create_params)
    p current_user
    @blog.user_id = current_user.id
    @blog.user = current_user
    if @blog.save
      render json: { resource: @blog, msg: '创建博客成功！' }, status: 200
    else
      render json: { resource: nil }, status: :bad_request
    end
  end

  def index
    blogs = Blog.all

    render json: { resource: blogs.as_json(include: {}), total: blogs.length, page: 1 }, status: 200
  end

  def show
    @blog = Blog.find(params[:id])
    user = User.find(@blog.user_id)
    @blog = @blog.as_json.merge(:user => user)
    render json: { resource: @blog, total: @blog, page: 1 }, status: 200
  end

  def create_params
    params.require(:blog).permit(:title, :description, :content, :at_index)
  end

end