class CreateReses < ActiveRecord::Migration[5.2]
  def change
    create_table :reses do |t|
      t.text :content
      t.integer :my_thread_id

      t.timestamps
    end
  end
end
