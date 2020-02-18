class CreateJoinTableServiceInstanceServiceCredentials < ActiveRecord::Migration[5.2]
  def change
    create_table :service_instance_service_credentials do |t|
      t.references :tenant, :index => true, :foreign_key => {:on_delete => :cascade}
      t.references :service_credential, :null => false, :index => false, :foreign_key => {:on_delete => :cascade}
      t.references :service_instance, :null => false, :index => false, :foreign_key => {:on_delete => :cascade}

      t.timestamps

      t.datetime :last_seen_at

      t.index %i[service_credential_id], :name => :index_service_instance_credentials_on_service_credential_id
      t.index %i[service_instance_id], :name => :index_service_instance_credentials_on_service_instance_id
      t.index %i[last_seen_at]
      t.index %i[service_credential_id service_instance_id], :unique => true, :name => :index_service_instance_credential_id
    end

  end
end
