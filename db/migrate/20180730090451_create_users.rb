class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :wechat_id
      t.string :wechat_name
      t.string :description

      t.timestamps
    end
  end
end
