module SpreeI18n
  extend ActiveSupport::Concern
  
  included do
    before_action :set_locale    
  end
  
  def set_locale
    I18n.locale = params[:locale] || implied_locale
  end

  private
  
    def implied_locale
      request.env.fetch("HTTP_ACCEPT_LANGUAGE", "")
        .include?("pt") ? "pt" : "en"
    end    
end
