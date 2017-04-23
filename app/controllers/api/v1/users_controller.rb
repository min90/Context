class Api::V1::UsersController < Api::BaseController

  def create
    name = params[:user][:name]
    user = User.find_by_name(name)
    if user.nil?
      user = User.create(name: name)
    end
    respond_to do |format|
      format.json { render json: user.hash, status: :ok }
      format.json { render json: user.errors, status: 500 }
    end
  end

  def permitted_params
    params.require(:user).permit(:name)
  end

end
