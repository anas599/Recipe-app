class CreatePublicResipes < ActiveRecord::Migration[7.0]
  def change
    create_table :public_resipes do |t|

      t.timestamps
    end
  end
end
