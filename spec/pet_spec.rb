require_relative '../app/pet.rb'

describe 'pet' do
  subject(:pet) { Pet.new }
  let(:obj_pet) {attributes_for(:status_sold)}

  context 'crud - pet' do
    it 'cadastrar pet' do
      # Esse testes, apenas precisamos informar o body com as informaçoes necessárias.
      resultado = pet.cadastrar(obj_pet)

      expect(resultado.code).to eq(200)
    end

    it 'buscar pet cadastrado' do
      # Nesse teste teste, a api apresenta um BUG. Mesmo inserindo um status inválido, ou lançando o mesmo como nil, o status que devolve é o HTTP200      
      resultado_criacao = pet.cadastrar(obj_pet)
      estado            = resultado_criacao['status']
      resultado         = pet.buscar_pet(estado)
      achou_status      = resultado.any? { |compara| compara['status'] == resultado_criacao['status'] }
     
      expect(resultado.code).to eq(200)
      expect(achou_status).to be_truthy
    end

    it 'alterar pet cadastrado' do
      # Por padrão, coloquei o status para ser Sold. Verificar no LET
      # Em caso de teste, insira os puts em Resultado_criacao e Resultado

      resultado_criacao = pet.cadastrar(obj_pet)
      obj_pet[:status]  = "available"
      resultado         = pet.alterar(obj_pet)
      
      expect(resultado.code).to eq(200)
      expect(resultado['status']).to eq("available")
    end
    
    it 'deletar pet cadastrado' do
      # Relizei a criação de um novo pet, guardei o valor de ID do pet e em seguida, solicitei a exclusão.
      # Após, solicitei uma busca pelo ID antes excluído para fazer a comparação com o OBJ_PET gerado na criação, o que teria que retornar false.
      # Em caso de teste, insira os puts em id_pet, resultado e existe_id

      resultado_criacao = pet.cadastrar(obj_pet)
      id_pet            = resultado_criacao['id']
      resultado         = pet.deletar(id_pet)
      resultado_filtro  = pet.buscar_pet(id_pet)
      existe_id         = resultado_filtro.any? {|existe| existe['id'] == obj_pet[:id]}

      expect(resultado.code).to eq(200)
      expect(existe_id).to be_falsey
    end
  end
end
