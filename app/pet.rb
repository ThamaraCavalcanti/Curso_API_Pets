class Pet
    # usamos o ENV para gerenciar nossa variavel URI, que segue o mesmo padrão, 
    # para diminuirmos a repetição de codigo, facilitar a leitura e manutenção do código.
    @@uri = ENV['BASE_URI']

    def cadastrar(body)
        response = without_authentication('post', @@uri, body.to_json)
    end

    def buscar_pet(estado)
        uri      = "#{ENV['BASE_URI']}/findByStatus?status=#{estado}"
        response = without_authentication('get', uri)
    end

    def alterar(body)
        response = without_authentication('put', @@uri, body.to_json)
    end

    def deletar(id_pet)
        uri      = "#{ENV['BASE_URI']}/#{id_pet}"
        response = without_authentication('delete', uri)
    end
end