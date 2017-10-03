class User < ActiveRecord
  validates :name, :nickname, :email, :phone, :is_driver?, presence: true

  def register
  end

  def change_status
  end
end
