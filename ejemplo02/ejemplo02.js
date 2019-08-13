function run() {
    const input = document.getElementById('input').value;

    var result = grammar.parse(input);

    document.getElementById('result').innerText = 'El resultado es: ' + result;
}