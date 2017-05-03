class AddLastReadAtToMemberships < ActiveRecord::Migration[5.0]
  def change
    add_column :memberships, :last_read_at, :datetime
  end
end
