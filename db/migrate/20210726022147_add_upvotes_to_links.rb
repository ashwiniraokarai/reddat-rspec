class AddUpvotesToLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :links, :upvotes, :integer, default: 0, null: false
  end
end
