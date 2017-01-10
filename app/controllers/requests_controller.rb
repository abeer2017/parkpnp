class RequestsController < ApplicationController

  def new
    @request = Request.new
  end

  def create
    @user = current_user
    @request = @user.requests.create(request_params)
    if @request.save
      redirect_to user_request_path(@request,@user)
    else
      flash.now[:error] = "Could not booking"
      render new
    end
  end

  private

  def request_params
    params.require(:request).permit(:approve, :total_cost, :start_time, :end_time, :parking_space_id)
  end

end
