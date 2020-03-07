class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|  #we are telling ruby about the table we are creating and active record knows how to create it
      t.string :email # this is a method that creates a column called email that is a string
      t.string :password
      t.integer :score 
      
    end 
  end
end
