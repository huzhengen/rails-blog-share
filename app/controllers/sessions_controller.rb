class SessionsController < ApplicationController
  def create
    s = Session.new create_params
    if s.validate
      res = User.find(s.user.id).as_json(except: [:password_digest])
      render json: { resource: res }, status: 200
      session[:current_user_id] = s.user.id
    else
      err = s.errors.messages[:email][0] || s.errors.messages[:password][0] || s.errors.messages[:password_confirmation][0]
      render json: { error: err }, status: 422
    end
  end

  def destroy
    session[:current_user_id] = nil
    # head :ok
    render json: { resource: nil, isLogin: false }, status: 200
  end

  def create_params
    params.permit(:email, :password)
  end
end