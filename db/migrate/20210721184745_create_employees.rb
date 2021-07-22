class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :last_name
      t.string :rfc
      t.string :job_title
      t.references :office, null: false, foreign_key: true

      t.timestamps
    end
  end
end
