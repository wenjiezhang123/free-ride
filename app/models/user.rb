class User < ApplicationRecord
  validates :name, :nickname, :email, :phone, :is_driver?, :password, presence: true

  def change_status
  end
end
