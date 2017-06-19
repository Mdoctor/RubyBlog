class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.integer :query_id
      t.integer :document_id
      t.integer :api_id

      t.timestamps
    end
  end
end
