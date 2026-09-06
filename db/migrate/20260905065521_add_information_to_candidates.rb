class AddInformationToCandidates < ActiveRecord::Migration[8.1]
  def change
    add_column :candidates, :name, :string, null: false
    add_column :candidates, :image, :string
    add_column :candidates, :gender, :string
    add_column :candidates, :birth_date, :date
    add_column :candidates, :short_bio, :text
    add_column :candidates, :description, :text
    add_column :candidates, :occupation, :string
    add_column :candidates, :education, :string
    add_column :candidates, :experience, :text
    add_column :candidates, :vision, :text
    add_column :candidates, :mission, :text
    add_column :candidates, :candidate_number, :integer
    add_column :candidates, :status, :string, null: false, default: "active"
  end
end
