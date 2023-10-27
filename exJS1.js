var clientes = [
    {
    "id": 1,
    "nome": "Luis Santos Silveira",
    "idade": 18
    },
    {
    "id": 2,
    "nome": "Ricardo Lopes Alves",
    "idade": 30
    },
    {
    "id": 3,
    "nome": "Gustavo Silva Junior",
    "idade": 26
    }
    ];
    function returnClients() {
        for (var i = 0; i < clientes.length; i++) {
        var ultimoSobrenome = clientes[i].nome.split(" ")[2];
        var primeiroNome = clientes[i].nome.split(" ")[0];
        console.log(primeiroNome + " " + ultimoSobrenome);
        }
    }
    returnClients()

    // No código fornecido havia alguns erros de síntaxe que tiveram que ser arrumados, por ex o array estava sendo declarado com {} e não [], além da falta de aspas em algumas propriedades.