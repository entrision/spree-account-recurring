class AddDisplayOnToSpreeRecurring < ActiveRecord::Migration
  def change
    add_column :spree_recurrings, :display_on, :string
  end
end
