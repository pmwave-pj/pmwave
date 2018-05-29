class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :shosai
      t.datetime :kigen
      t.boolean :kanryo
      t.timestamps
    end
  end
end