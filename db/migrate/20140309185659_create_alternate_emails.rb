class CreateAlternateEmails < ActiveRecord::Migration
  def change
    create_table :alternate_emails do |t|
      t.string :email
      t.references :user, index: true
      
      t.timestamps
    end
  end
end
