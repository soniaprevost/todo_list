require 'benchmark'

class Work < ActiveRecord::Base
  belongs_to :user

  validates :description, presence: :true
  validates :user_id, presence: :true

  def time_taken(work)
    ((work.updated_at - work.created_at)/60000)
  end

  def timer(work)
    start_time = work.created_at
    until work.updated_at
      new_time = Time.now
    end
  end
end
