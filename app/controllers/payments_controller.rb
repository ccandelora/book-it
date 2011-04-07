class PaymentsController < ApplicationController

  before_filter :authenticate

  add_breadcrumb "Payment type", :new_payment_path
  
  def new
    @payments = Payment.all
    @payment = Payment.new
  end
  
  def create
    @payments = Payment.all    
    @payment = Payment.new(params[:payment])
    if @payment.save
      redirect_to bookings_path, :notice => 'Payment successfully added.'
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
  end    

end
