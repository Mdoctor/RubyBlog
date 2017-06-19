class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.string :origin_id
      t.string :content_type
      t.integer :provider

      t.timestamps
    end
  end
end
