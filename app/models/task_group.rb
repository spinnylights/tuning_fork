class TaskGroup < ApplicationRecord
  belongs_to :day
  has_many   :tasks
  has_one    :scratch
end
