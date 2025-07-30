class CreateWeddings < ActiveRecord::Migration[6.1]
  def change
    create_table :weddings do |t|
      t.string :couple_names
    end
  end
end
