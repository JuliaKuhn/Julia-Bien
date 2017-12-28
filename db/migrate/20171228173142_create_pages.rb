class CreatePages < ActiveRecord::Migration[5.1]
  def change
    create_table :pages do |t|
      t.string :titel
      t.text :body
      t.string :url
      t.string :image

      t.timestamps
    end
  end
end
