require_relative '../models/obj_categoria.rb'

FactoryBot.define do
    factory :attr_categoria, class: ObjCategoria do
        id{0}
        name{"#{Faker::Creature::Cat.breed}"}
    end
end