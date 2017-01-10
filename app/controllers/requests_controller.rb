class RequestsController < ApplicationController

  def new
    @request = Request.new
  end

  def index
    @request_hold = current_user.requests.where(approve: false)
    @request_approve = current_user.requests.where(approve: true)
  end

  def create
    @user = current_user
    @request = @user.requests.create(request_params)
    if @request.save
      redirect_to user_requests_path(@request,@user)
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
