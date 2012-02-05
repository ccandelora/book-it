class PaymentsController < ApplicationController

  before_filter :authenticate

  add_breadcrumb "Settings", :settings_path
  
  def new
    add_breadcrumb "New payment status", :new_payment_path
    
    @payments = Payment.all
    @payment = Payment.new
  end
  
  def create
    @payments = Payment.all    
    @payment = Payment.new(params[:payment])
    if @payment.save
      redirect_to bookings_path, :notice => 'Payment status successfully added.'
    else
      render :action => 'new'
    end
  end
  
  def destroy
    @payment = Payment.find(params[:id])
    @payment.destroy
  end    

end
