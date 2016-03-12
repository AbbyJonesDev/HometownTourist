FactoryGirl.define do

  factory :stop do
    name "Amazing Tourist Stop"
    location "123 Main Street; My Town, NE 68134"
    lat 15.245
    lon 90.0
    description Faker::Lorem.paragraphs(3)
    website "http://www.example.com"
    featured_image Faker::Internet.url
    category #association
    tag #association
  end

  factory :event do
    name "Exciting Tourist Event"
    location "123 Main Street; My Town, NE 68134"
    start_date Faker::Date.backward
    end_date Faker::Date.forward
    lat 15.245
    lon 90.0
    description Faker::Lorem.paragraphs(3)
    website "http://www.example.com"
    featured_image Faker::Internet.url
    # category  #association
    # tag #association
  end

  factory :category do
    name "Outdoors"
    description "Explore nature, enjoy fresh air"
    stop  #association
    event  #association
  end

  factory :tag do
    name "Family Friendly"
    stop  #association
    event  #association
  end
end