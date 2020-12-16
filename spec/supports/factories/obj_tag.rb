require_relative '../models/obj_tag.rb'

FactoryBot.define do
    factory :attr_tag, class: ObjTag do
        id {0}
        name {"#{Faker::Gender.binary_type}"}
    end
end