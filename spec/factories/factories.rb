FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "Robot-#{n}" }
    sequence(:email) { |n| "robot#{n}@factory.com" }
    password 'verysecret'
    password_confirmation 'verysecret'
  end

  factory :post do
    text 'Wer das in der willkürlichen, aber konventionellen Anordnung der Grapheme an erster Stelle stehende Zeichen artikuliert, verpflichtet sich dadurch stillschweigend zur subsequenziellen Artikulation des zweiten.'
    association :user
  end

  factory :group do
    sequence(:name) { |n| "Group-#{n}" }
  end
end