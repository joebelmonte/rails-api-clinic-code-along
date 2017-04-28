class CreatePatients < ActiveRecord::Migration[5.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :diagnosis
      t.date :born_on

      t.timestamps
    end
  end
end
