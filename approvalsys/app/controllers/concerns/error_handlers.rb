module ErrorHandlers
  extend ActiveSupport::Concern

  # 例外処理
  included do
    class Forbidden < ActionController::ActionControllerError; end
    class IpAddressRejected < ActionController::ActionControllerError; end

    rescue_from Forbidden, with: :render_403
    rescue_from IpAddressRejected, with: :render_403
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
    #rescue_from Exception, with: :render_500
  end

  def render_403
    render template: "errors/error_403", status: 403, layout: "common", content_type: "text/html"
  end

  def render_404
    render template: "errors/error_404", status: 404, layout: "common", content_type: "text/html"
  end

  def render_500
    render template: "errors/error_500", status: 500, layout: "common", content_type: "text/html"
  end
end
