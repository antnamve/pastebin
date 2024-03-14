class CreatePastes < ActiveRecord::Migration[7.2]
  def change
    create_table :pastes do |t|
      t.text :body
      t.references :user

      t.timestamps
    end
  end
end
