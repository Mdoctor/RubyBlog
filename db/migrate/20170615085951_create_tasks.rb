class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :iteration_id
      t.integer :api_id
      t.string :callback
      t.integer :status
      t.timestamps
    end
  end
end
