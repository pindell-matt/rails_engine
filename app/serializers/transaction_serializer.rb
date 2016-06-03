class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :credit_card_number, :invoice_id
  attribute  :formatted_result, key: :result

  def formatted_result
    object.result
  end
end
