class CallbacksController < ApplicationController
  def facebook
    current_user.update_attributes(uid: omniauth_params[:uid],
                                   token: omniauth_params[:credentials][:token])
    redirect_to :root
  end

  def failure
    flash[:error] = 'You could not login to facebook'
    redirect_to :root
  end

  private
  def omniauth_params
    request.env["omniauth.auth"]
  end
end
