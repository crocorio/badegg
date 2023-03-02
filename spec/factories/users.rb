FactoryBot.define do
  factory :user do
    
    email                 { "test@example" }
    password              { 'bizcliz4life' }
    password_confirmation { 'bizcliz4life' }
  end
end