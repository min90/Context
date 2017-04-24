class Api::V1::ArrivalsController < Api::BaseController

  def create
    name = params[:arrival][:name]
    arrived = params[:arrival][:arrived]
    user = User.find_by_name(name)
    respond_to do |format|
      if user.nil?
        format.json {render json: "No user exist for that name", status: 500}
      else
        current_arrived = Arrival.find_by_user_id(user.id)
        if current_arrived
          current_arrived.update(arrived: arrived)
          format.json { render json: current_arrived.hash, status: :ok }
        else
          new_arrived = Arrival.new(user: user, arrived: arrived)
          if new_arrived.save
            format.json { render json: new_arrived.hash, status: :ok }
          else
            format.json { render json: new_arrived.errors, status: :ok }
          end
        end
      end
    end
  end

  def permitted_params
    params.require(:arrival).permit(:name, :arrived)
  end

end
