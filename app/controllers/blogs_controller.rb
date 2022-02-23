class BlogsController < ApplicationController
  # before_action :must_sign_in

  def create
    @blog = Blog.new(create_params)
    @blog.user_id = current_user.id
    @blog.user = current_user
    if @blog.save
      render json: { resource: @blog, msg: '创建博客成功！' }, status: 200
    else
      render json: { resource: nil }, status: :bad_request
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(create_params)
      render json: { resource: @blog, msg: '更新博客成功！' }, status: 200
    else
      render json: { resource: nil }, status: :bad_request
    end
  end

  def index
    blogs = Blog.where(at_index: params[:at_index])
                .page(params[:page].to_i).order('created_at DESC')
    unless params[:userId].nil?
      blogs = Blog.where(user_id: params[:userId])
                  .page(params[:page].to_i).order('created_at DESC')
    end
    # render json: { resource: blogs.as_json(include: {}), total: blogs.length, page: 1 }, status: 200
    render json: {
      resource: blogs.as_json(include: { 'user': { except: [:password_digest] } }),
      total: blogs.length,
      page: params[:page].to_i
    }, status: 200
  end

  def show
    @blog = Blog.find(params[:id])
    user = User.find(@blog.user_id)
    @blog = @blog.as_json.merge(:user => user)
    render json: { resource: @blog, total: @blog.length }, status: 200
  end

  def destroy
    @blog = Blog.find(params[:id])
    render json: {}, status: 200 if @blog.destroy
  end

  def create_params
    params.require(:blog).permit(:title, :description, :content, :at_index)
  end

end