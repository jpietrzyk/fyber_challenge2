class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :name
    end
  end
end
