class AddAllocatedTimeToWork < ActiveRecord::Migration
  def change
    add_column :works, :allocated_time, :integer
  end
end
