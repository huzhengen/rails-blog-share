class EventsController < ApplicationController

  def create
    @event = Event.new(create_params)
    # @blog.user_id = current_user.id
    # @blog.user = current_user
    if @event.save
      render json: { resource: @event, msg: '创建 event 成功！' }, status: 200
    else
      render json: { resource: nil }, status: :bad_request
    end
  end

  def update
    @event = Event.find(params[:id])
    p '---------------'
    p @event[:status_b]
    if @event.update(create_params)
      render json: { resource: @event, msg: '更新成功！' }, status: 200
    else
      render json: { resource: nil }, status: :bad_request
    end
  end

  def index
    events = Event.all.where(date: params[:date])
   
    render json: {
      resource: events,
      total: events.length,
    }, status: 200
  end

  def show
    # @blog = Blog.find(params[:id])
    # user = User.find(@blog.user_id)
    # @blog = @blog.as_json.merge(:user => user)
    # if current_user
      # @blog = Blog.includes(:user).where(id: params[:id], user: current_user).first
    # else
    blog = Blog.find(params[:id])
    @blog = Blog.includes(:user).where(id: params[:id], user: blog.user_id).first
    # end
    @blog = @blog.as_json.merge(user: @blog.user)
    render json: { resource: @blog, total: @blog.length }, status: 200
  end

  def destroy
    @blog = Blog.find(params[:id])
    render json: {}, status: 200 if @blog.destroy
  end

  def create_params
    params.require(:event).permit(:status_a, :status_b, :status_c, :status_d, :date, :time)
  end

end