class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body, null:false
      t.references :user, null:false, foreign_key:true
      t.references :group, null:false, foreign_key:true
      t.string :image
      t.timestamps
    end
  end
end
