class ApplicationController < ActionController::Base
  rescue_from StandardError, with: :render_standard_error

  private

  def render_standard_error(exception)
    render json: { error: exception.message }, status: :internal_server_error
  end
end
