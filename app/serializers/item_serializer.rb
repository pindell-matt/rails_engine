class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :merchant_id
  attribute :unit_price_to_dollar, key: :unit_price

  def unit_price_to_dollar
    (object.unit_price / 100.00).to_s
  end
end
