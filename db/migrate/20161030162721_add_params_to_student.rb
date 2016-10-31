class AddParamsToStudent < ActiveRecord::Migration[5.0]
  def change
  	add_column :students, :first_name, :string
  	add_column :students, :last_name, :string
  	add_column :students, :email, :string
  	add_column :students, :phone, :string
  	add_column :students, :short_bio, :text
  	add_column :students, :linkedin, :string
  	add_column :students, :twitter, :string
  	add_column :students, :blog, :string
  	add_column :students, :online_resume, :string
  	add_column :students, :github, :string
  	add_column :students, :photo, :string
  end
end
