require 'digest/md5'

class UsersController < ApplicationController
  def create
    @user = User.new create_params
    email_address = params[:email].downcase
    hash = Digest::MD5.hexdigest(email_address)
    # image_src = "https://www.gravatar.com/avatar/#{hash}"
    image_src = "https://sdn.geekzu.org/avatar/#{hash}"
    @user[:gravatar_url] = image_src
    if @user.save
      render json: { resource: @user.as_json(except: [:password_digest]), msg: '注册成功！' }, status: 200
    else
      err = @user.errors.messages[:email][0] || @user.errors.messages[:password][0] || @user.errors.messages[:password_confirmation][0]
      render json: { error: err }, status: 422
    end
  end

  def me
    # render_resource current_user
    if current_user.nil?
      render json: { resource: nil, isLogin: false }, status: 200
      return
    end
    if current_user.errors.empty?
      render json: { resource: current_user.as_json(except: [:password_digest]), isLogin: true }, status: 200
    else
      err = current_user.errors.messages[:email][0] || current_user.errors.messages[:password][0] || current_user.errors.messages[:password_confirmation][0]
      render json: { error: err }, status: 422
    end
  end

  def create_params
    params.permit(:email, :password, :password_confirmation)
  end

end