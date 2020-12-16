require_relative '../models/obj_pet.rb'
#Para cada OBJETO que tenha seus atributos, criar um model e uma factory.
#formas de criar uma factory. build, create, attributes_for(e suas variacoes), build_stubbed
FactoryBot.define do
  factory :attr_pet, aliases: [:status_available],  class: ObjPet do
    id { 0 }
    category { attributes_for(:attr_categoria) }
    name { "#{Faker::Creature::Cat.name}" }
    photoUrls {[""]}
    tags { attributes_for_list(:attr_tag, 1) }
    status { 'available' }

    trait :status_pending do
        status {"pending"}
    end

    trait :status_sold do
        status {"sold"}
    end

    factory :attr_pet_pending, aliases: [:status_pending], traits: [:status_pending]
    factory :attr_pet_sold, aliases: [:status_sold], traits: [:status_sold]
  end
end
