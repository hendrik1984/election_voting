class CreateElections < ActiveRecord::Migration[8.1]
  def change
    create_table :elections do |t|
      t.string :title, null: false
      t.text :description
      t.datetime :start_at
      t.datetime :end_at
      t.string :status, null: false, default: "active"

      t.timestamps
    end
  end
end
