class AddUniqueIndexToVotesUserElection < ActiveRecord::Migration[8.1]
  def change
    add_index :votes,
              [:user_id, :election_id],
              unique: true,
              name: "index_votes_on_user_id_and_election_id_unique"
  end
end
