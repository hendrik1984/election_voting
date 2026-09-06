class AddElectionToCandidates < ActiveRecord::Migration[8.1]
  def change
    add_reference :candidates, :election, null: false, foreign_key: true
  end
end
