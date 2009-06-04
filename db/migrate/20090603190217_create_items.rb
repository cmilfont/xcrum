class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :description
      t.integer :project_id
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end

