class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit
  #protect_from_forgery with: :exception
  before_action :set_locale

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  include Pundit
  include Auth

  def set_locale
    @params_locale = params[:locale]
    if @params_locale.present?
      begin
        I18n.locale = @params_locale
        @params_locale = I18n.locale
      rescue
        I18n.locale = I18n.default_locale
      end
    else
      I18n.locale = I18n.default_locale
    end
  end

  def default_url_options
    { locale: I18n.locale }
  end
  def user_for_paper_trail
    current_user
  end



  private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
end
