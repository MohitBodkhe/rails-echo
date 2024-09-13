class CreateJwtBlacklist < ActiveRecord::Migration[7.1]
  def change
    def change
      create_table :jwt_blacklists do |t|
        t.string :jti, null: false
        t.datetime :exp, null: false
  
        t.timestamps
      end
  
      add_index :jwt_blacklists, :jti, unique: true
    end
  end
end
