function run() {
    const input = document.getElementById('input').value;

    console.log('Procesando entrada `' + input + '`');

    const result = grammar.parse(input);

    document.getElementById('arbol').innerHTML = JSON.stringify(result);

    document.getElementById('result').innerHTML = 'El resultado es: ' + result.contador;

}