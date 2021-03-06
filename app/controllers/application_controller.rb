class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  rescue_from StandardError, with: :show_error

  def robots
    user_agents = '*'
    disallow = '/'
    res = ''
    if ENV['BLOCK_BOTS']
      res = [
        "User-agent: #{user_agents} # we don't like those bots",
        "Disallow: #{disallow} # block bots access to those paths"
      ].join("\n")
    end
    render text: res, layout: false, content_type: 'text/plain'
  end

  def show_error(exception)
    ap exception.backtrace
    flash[:danger] = exception.message
    redirect_to :back
  rescue ActionController::RedirectBackError
    redirect_to '/'
  end
end
