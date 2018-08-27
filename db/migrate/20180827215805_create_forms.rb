class CreateForms < ActiveRecord::Migration[5.1]
  def change
    create_table :forms do |t|
      t.integer :current_form_request_id

      t.timestamps
    end
    add_index :forms, :current_form_request_id
  end
end
