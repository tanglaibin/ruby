module CheckPermission
  extend ActiveSupport::Concern

  # 権限があるかをチェック
  def check_role_permission!(key)
    # システム管理者、指定権限の管理者以外
    if current_user.role.code != Const.role.system_admin && current_user.role.code != key
      render template: "errors/error_403", status: :forbidden, layout: "common", content_type: "text/html"
    end
  end
end
