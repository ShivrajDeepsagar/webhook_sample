class CreateWebhooks < ActiveRecord::Migration[6.0]
  def change
    create_table :webhooks do |t|
      t.string :url
      t.text :payload

      t.timestamps
    end
  end
end
