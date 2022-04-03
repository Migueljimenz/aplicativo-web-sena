class CreateAreas < ActiveRecord::Migration[7.0]
  def change
    create_table :areas do |t|
      t.string :nombreArea
      t.timestamps
    end
  end
end
