
class CreateEntries < ActiveRecord::Migration[6.1]
    def change  
     create_table :entries do |t|
        t.text :title
        t.text :location
        t.text :description
        t.references :user, foreign_key: true
    

        t.timestamps
     end
 
    end
 end