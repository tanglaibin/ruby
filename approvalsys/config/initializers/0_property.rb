class Const < Settingslogic
  source "#{Rails.root}/config/property.yml"
  namespace Rails.env
end
