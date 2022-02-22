class UsersController < ApplicationController
  def create
    render_resource User.create create_params
  end

  def me
    # render_resource current_user
    if current_user.nil?
      render json: { resource: nil, isLogin: false }, status: 200
      return
    end
    if current_user.errors.empty?
      render json: { resource: current_user, isLogin: true }, status: 200
    else
      err = current_user.errors.messages[:email][0] || current_user.errors.messages[:password][0] || current_user.errors.messages[:password_confirmation][0]
      render json: { error: err }, status: 422
    end
  end

  def create_params
    params.permit(:email, :password, :password_confirmation)
  end

end