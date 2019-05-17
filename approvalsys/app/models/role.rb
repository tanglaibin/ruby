class Role < ApplicationRecord
  # 複数role対応
  has_many :users
end
