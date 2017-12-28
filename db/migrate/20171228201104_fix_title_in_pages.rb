class FixTitleInPages < ActiveRecord::Migration[5.1]
  def change
    rename_column :pages, :titel, :title
  end
end
