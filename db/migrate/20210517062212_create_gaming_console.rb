class CreateGamingConsole < ActiveRecord::Migration[6.1]
  def change
    create_table :gaming_consoles do |t|
      t.string :name
      t.string :manufacturer

      t.timestamps
    end
  end
end
