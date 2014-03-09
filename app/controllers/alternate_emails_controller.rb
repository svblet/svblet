class AlternateEmailsController < ApplicationController
  def new
  	@user = current_user
    @alternate_email = @user.alternate_emails.build
  end

  def create
  	@user = current_user
  	@alternate_email = @user.alternate_emails.new(alternate_email_params)

    @successful_save = @alternate_email.save
    
    respond_to do |format|
        format.js
    end
  end

  private
  	def alternate_email_params
      params.require(:alternate_email).permit(:email)
    end
end
