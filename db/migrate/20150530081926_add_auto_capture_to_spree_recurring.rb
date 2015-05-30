class AddAutoCaptureToSpreeRecurring < ActiveRecord::Migration
  def change
    add_column :spree_recurrings, :auto_capture, :boolean
  end
end
