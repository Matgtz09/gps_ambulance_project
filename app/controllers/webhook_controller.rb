class WebhookController < ApplicationController
  layout 'no_sidebar' # Apply the layout without the sidebar

  def new
    # Render the login form view
  end

  def create
    # Find ambulance based on the provided name and registration number
    @ambulance = Ambulance.find_by(name: params[:ambulance_name], registration_number: params[:registration_number])

    if @ambulance.present?
      # Redirect to the location tracking page with the ambulance ID
      redirect_to tracking_path(ambulance_id: @ambulance.id)
    else
      # Render the form again with an error message
      flash[:error] = "Unable to authenticate ambulance."
      render :new
    end
  end

  def show
    # The tracking view where the location updates are handled
    @ambulance = Ambulance.find(params[:ambulance_id])
  rescue ActiveRecord::RecordNotFound => e
    logger.error "Ambulance not found: #{e.message}"
    render plain: "Ambulance not found", status: :not_found
  end
end
