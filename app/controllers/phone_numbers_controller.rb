class PhoneNumbersController < ApplicationController
  def new
    @user = current_user
    @phone_number = @user.phone_numbers.build
  end

  def create
    @user = current_user
    @phone_number = @user.phone_numbers.new(phone_number_params)

    @successful_save = @phone_number.save
    
    respond_to do |format|
        format.js
    end
  end

  private
    def phone_number_params
      return_params = ActionController::Parameters.new(
        number: params[:number]
      )
      return_params.permit!
    end
end
