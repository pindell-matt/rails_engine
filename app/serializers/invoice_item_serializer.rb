class InvoiceItemSerializer < ActiveModel::Serializer
  attributes :id, :invoice_id, :item_id, :quantity
  attribute  :unit_price_to_dollar, key: :unit_price

  def unit_price_to_dollar
    (object.unit_price / 100.00).to_s
  end

end
