require_relative '../app/pet.rb'

describe 'pet' do
  subject(:pet) { Pet.new }

  context 'crud - pet' do
    #Cadastro solicita o BODY como REQUIRE*
    it 'cadastro de pet' do
      body = {
        "id": 0,
        "category": {
          "id": 0,
          "name": 'doguinho',
        },
        "name": 'Jureminha',
        "photoUrls": [''],
        "tags": [
          {
                    "id": 0,
                    "name": 'buldog',
                  },
        ],
        "status": 'available',
      }.to_json

      resultado = pet.cadastrar(body)
      expect(resultado.code).to eq(200)
    end

    it 'buscar pet' do
      #!Nesse teste teste, a api apresenta um BUG. Mesmo inserindo  um status invalido, ou lançando o mesmo como nil, o status que devolve é o 200
      body = {
        "id": 0,
        "category": {
          "id": 0,
          "name": 'cat',
        },
        "name": 'fild',
        "photoUrls": [''],
        "tags": [
          {
                "id": 0,
                "name": 'gatinho',
              },
        ],
        "status": 'pending',
      }.to_json
      estado            = 'pending'
      resultado_criacao = pet.cadastrar(body)
      resultado         = pet.buscar_pet(estado)
      achou_status      = resultado.any? { |compara| compara['status'] == resultado_criacao['status'] }
     
      expect(resultado.code).to eq(200)
      expect(achou_status).to be_truthy
    end

    it 'alterar pet cadastrado' do
      body = {
        "id": 9222968140496873682,
        "category": {
          "id": 0,
          "name": 'cat',
        },
        "name": 'fild',
        "photoUrls": [''],
        "tags": [
          {
                "id": 0,
                "name": 'alterei',
              },
        ],
        "status": 'available',
      }.to_json

      resultado = pet.alterar(body)
      expect(resultado.code).to eq(200)
    end
    
    it 'deletar pet cadastrado' do
    end

  end
end
