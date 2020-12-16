class Pet
    def cadastrar(body)
        uri      = "https://petstore.swagger.io/v2/pet"
        response = without_authentication('post', uri, body)
    end

    def buscar_pet(estado)
        uri      = "https://petstore.swagger.io/v2/pet/findByStatus?status=#{estado}"
        response = without_authentication('get', uri)
    end

    def alterar(body)
        uri      = "https://petstore.swagger.io/v2/pet"
        response = without_authentication('put', uri, body)
    end

    def deletar(id_pet)
        uri      = "https://petstore.swagger.io/v2/pet/#{id_pet}"
        response = without_authentication('delete', uri)
    end
end