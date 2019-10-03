class CallbacksController < ApplicationController
  def facebook
    page_access_token = Facebook
      .fbgraph(omniauth_params[:credentials][:token])
      .get_connections('me', 'accounts')
      .first['access_token']

    current_user.update_attributes(uid: omniauth_params[:uid],
                                   token: omniauth_params[:credentials][:token],
                                   page_token: page_access_token)
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
