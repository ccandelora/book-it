class SettingsController < ApplicationController
  before_filter :authenticate

  add_breadcrumb "Settings", :settings_path

  def index
    @payments = Payment.all
    @users = User.all
  end
end
