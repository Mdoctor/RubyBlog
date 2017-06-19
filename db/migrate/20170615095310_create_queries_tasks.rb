class CreateQueriesTasks < ActiveRecord::Migration
  def change
    create_table :queries_tasks do |t|
      t.integer :query_id
      t.integer :task_id

      t.timestamps
    end
  end
end
