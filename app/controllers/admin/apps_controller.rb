class Admin::AppsController < AdminController
  def update
    if app.update(app_params)
      redirect_to({ action: :index }, success: "App updated")
    else
      render :index, warning: app.errors.full_messages.join(", ")
    end
  end

  private
  def app_params
    params.require(:app).permit(
      :share_title, :share_description, :share_image,
      :homepage_image, :bio_image, :contact_email,
      :twitter, :facebook, :instagram,
      :google_analytics_code
    )
  end
end
