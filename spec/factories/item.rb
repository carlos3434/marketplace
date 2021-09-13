FactoryBot.define do
  factory :item do
    name {'test'}
    price {'test'}
    brand {'test'}
    warantine_time {'test'}
    strength {'test'}
    flavor {'test'}
    size {'test'}
    category { create(:category) }
    #FactoryBot.create(:user, username: 'acushla', password: 'password', email:'items@gmail.com')
    user { create(:user) }
  end
end
