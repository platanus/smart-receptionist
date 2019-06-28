class Api::V1::UsersController < ApplicationController
  def index
    render json: User.active.where(is_bot: false)
  end
end
