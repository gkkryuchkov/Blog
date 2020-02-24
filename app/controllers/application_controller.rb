class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit
  protect_from_forgery prepend: true

  # before_action :set_locale

  include Auth

  # def set_locale
  #   @params_locale = params[:locale]
  #   if @params_locale.present?
  #     begin
  #       I18n.locale = @params_locale
  #       @params_locale = I18n.locale
  #     rescue
  #       I18n.locale = I18n.default_locale
  #     end
  #   else
  #     I18n.locale = I18n.default_locale
  #   end
  # end

  # def default_url_options
  #   { locale: I18n.locale }
  # end
  def user_for_paper_trail
    current_user
  end

  def render_error(error = 'Вы не можете совершать данное действие!', options = {})
    @error = error
    status = options[:status] || 403
    request.format = options[:format] if options[:format]
    respond_to do |format|
      format.html { render 'error', status: status }
      format.js { render js: %(alert("#{@error}")), status: status }
      format.json { render json: {error: @error}, status: status }
      session.destroy
    end
  end

  private

end
