class CreateQueryDocumentPairs < ActiveRecord::Migration
  def change
    create_table :query_document_pairs do |t|
      t.integer :query_id
      t.integer :document_id

      t.timestamps
    end
  end
end
