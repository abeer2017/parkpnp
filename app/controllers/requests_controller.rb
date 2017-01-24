class RequestsController < ApplicationController

  def index
    if current_user.role == true #Admin
      @request = Request.all.where(approve: false).order(created_at: :desc)
    else #User
      @request_hold = current_user.requests.where(approve: false).order(created_at: :desc)
      @request_approve = current_user.requests.where(approve: true).order(created_at: :desc)
    end
  end

  def new
    @request = Request.new
  end

  def create
    @user = current_user
    @request = @user.requests.create(request_params)
    if @request.save
      flash[:notice] = "Your request successfully send to Admin for approval. Check it in pending list below."
      redirect_to user_requests_path(@user,@request)
    else
      flash[:alert] = "Invalid Date and Time"
      redirect_to :back
    end
  end

  def approve
    if current_user.role == true
      @request = Request.find(params[:id])    
      @request.update(:approve => true)
      flash[:notice]="Request successfully approved"
      redirect_to user_requests_path(current_user)
    else
      flash[:alert] = "Not Authorized user"
      redirect_to :back
    end
  end

  def delete
    @request = Request.find(params[:id])
    if @request.destroy
      flash[:alert] = "Request successfully deleted."
    else
      flash[:alert] = "Request not delete."
    end
      redirect_to user_requests_path(current_user)
  end

  def request_params
    params.require(:request).permit(:approve, :total_cost, :start_time, :end_time, :parking_space_id)
  end

end
