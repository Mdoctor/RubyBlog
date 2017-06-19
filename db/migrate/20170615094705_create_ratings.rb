class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :query_document_pair_id
      t.integer :score
      t.integer :user_id

      t.timestamps
    end
  end
end
