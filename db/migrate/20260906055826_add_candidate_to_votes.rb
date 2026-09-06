class AddCandidateToVotes < ActiveRecord::Migration[8.1]
  def change
    add_reference :votes, :candidate, null: false, foreign_key: true
  end
end
