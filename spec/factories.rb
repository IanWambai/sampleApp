FactoryGirl.define do
	factory :user do
		name					"Foo Bar"
		email					"foo@bar.com"
		password 				"foobar"
		password_confirmation   "foobar"
	end
end

FactoryGirl.define do
	sequence :email do |n|
		"person-#{n}@example.com"
	end
end

FactoryGirl.define do
	factory :micropost do
		content 	"Foo Bar"
		association :user
	end
end