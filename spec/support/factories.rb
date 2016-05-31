FactoryGirl.define do

  factory :item do |f|
    f.name        { Faker::Commerce.product_name }
    f.description { Faker::Hipster.sentence }
    f.unit_price  { Faker::Commerce.price * 100 }
  end

  factory :invoice do |f|
    f.status "shipped"
  end

  factory :customer do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name  { Faker::Name.last_name }

    factory :customer_with_invoice do
      transient do
        invoices_count 2
      end

      after(:create) do |customer, evaluator|
        create_list(:invoice, evaluator.invoices_count, customer: customer)
      end
    end
  end

  factory :merchant do |f|
    f.name { Faker::Company.name }

    factory :merchant_with_items do
      transient do
        items_count 5
      end

      after(:create) do |merchant, evaluator|
        create_list(:item, evaluator.items_count, merchant: merchant)
      end
    end
  end

end
