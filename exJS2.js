var numero = "5(1)9-876-543-21";
    numero = "(" + numero.slice(0, 1) + numero.slice(2,4) + "_" + numero.slice(4,5) + "_" + numero.slice(6,9) + numero.slice(10,11) + "-" + numero.slice(11,13) + numero.slice(14,16);
    console.log(numero);