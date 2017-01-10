class RequestsController < ApplicationController

  def index
    if current_user.role == true #Admin
      @request = Request.all.where(approve: false)
      if params[:request_id]
        request = Request.find(params[:request_id])
        request.update(:approve => true)
        flash[:notice]="Request successfully approved"
      end
    else
      @request_hold = current_user.requests.where(approve: false)
      @request_approve = current_user.requests.where(approve: true)
    end
  end

  def new
    @request = Request.new
  end

  def create
    @user = current_user
    @request = @user.requests.create(request_params)
    if @request.save
      redirect_to user_requests_path(@user,@request)
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
