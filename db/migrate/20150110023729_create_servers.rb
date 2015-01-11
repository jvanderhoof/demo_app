class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      t.string :name
      t.string :status
      t.string :provider
      t.string :resource_type
      t.string :provider_identifier
      t.string :public_ip
      t.string :private_ip
      t.text :summary

      t.timestamps null: false
    end
  end
end
