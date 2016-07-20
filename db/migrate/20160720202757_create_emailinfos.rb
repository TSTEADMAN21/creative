class CreateEmailinfos < ActiveRecord::Migration
  def change
    create_table :emailinfos do |t|
      t.string :email_id

      t.timestamps null: false
    end
  end
end
