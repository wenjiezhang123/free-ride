class Post < ApplicationRecord
  validates :driver_id, :from, :to, :start_time, :split_gas?, presence: true
end
