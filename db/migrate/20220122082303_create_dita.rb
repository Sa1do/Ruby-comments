class CreateDita < ActiveRecord::Migration[7.0]
  def change
    create_table :dita do |t|
      t.integer :ditumner
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
