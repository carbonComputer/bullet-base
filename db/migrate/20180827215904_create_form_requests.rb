class CreateFormRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :form_requests do |t|
      t.integer :form_id
      t.integer :recipient_id

      t.timestamps
    end
    add_index :form_requests, :form_id
    add_index :form_requests, :recipient_id
  end
end
