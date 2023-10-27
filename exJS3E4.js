async function a() {
    b();
    await c();
    await d();
    alertUser("a")
}
a()

function b(){
    return;
    alertUser('b');
}

function c(){
    return new Promise((resolve) => {
        resolve();
        alertUser('c');
    })
}

function d(){
    return new Promise((resolve) => {
       alertUser('d');
    })
}

function alertUser(message) {
    console.log('A função é:' + message);
}

// A ordem dos prints é: "A função é:c", "A função é:d"

// Erro do código: A função alertUser é chamada três vezes antes de ser declarada seu valor
// Na function C, a promessa está sendo resolvida antes do alertUser ser chamado.
// Não existe await na function d, essa funcao retorna uma promisse, porém ela está sendo chamada na function a, se o await nao for usado, a function A não irá aguardar a conslusão de d.