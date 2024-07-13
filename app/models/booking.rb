class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :job
  enum status: { pending:"pending", accepted:"accepted", completed:"completed", canceled:"canceled" }
end
