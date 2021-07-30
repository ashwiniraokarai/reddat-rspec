class AddDownvotesToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :downvotes, :integer, default: 0, null: false
  end
end
