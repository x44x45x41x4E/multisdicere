class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :subdomain
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
