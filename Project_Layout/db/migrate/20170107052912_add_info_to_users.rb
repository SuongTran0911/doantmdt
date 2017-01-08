class AddInfoToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :firstName, :string
  	add_column :users, :lastName, :string
  	add_column :users, :company, :string
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  	add_column :users, :zip, :string
  	add_column :users, :phone, :string
  	add_column :users, :fax, :string
  	add_column :users, :country, :string
  	add_column :users, :address, :string
  	add_column :users, :address2, :string
  	# card payment
  	add_column :users, :creditCard, :string
  	add_column :users, :creditCardTypeID, :string
  	add_column :users, :cardExpMo, :string
  	add_column :users, :cardExpYr, :string
  end
end
