class CreditCardService

  def initialize(params)
    @source = params[:source]
    @email = params[:email]
    @amount = params[:amount]
  end

  def payment
    customer = Stripe::Customer.create(
        :email => @email,
        :source  => @source
      )
    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Service:Rails Stripe customer',
      :currency    => 'usd'
    )
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end