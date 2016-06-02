class CreateTransactions < ActiveRecord::Migration
  def change
    enable_extension 'citext'

    create_table :transactions do |t|
      t.references :invoice, index: true, foreign_key: true
      t.string :credit_card_number
      t.datetime :credit_card_expiration_date
      t.citext :result
      t.timestamps null: false
    end
  end
end
