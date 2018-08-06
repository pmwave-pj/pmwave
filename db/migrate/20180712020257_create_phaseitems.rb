class CreatePhaseitems < ActiveRecord::Migration[5.2]
  def change
    create_table :phaseitems do |t|
      t.string :phaseitem
      t.string :imptitem
      t.string :statusitem
      t.string :cgritem
    end
  end
end
