# Gerador-de-Recibo-Fiscal


## Introdução

O programa é a resolução de um trabalho da matéria de Programação funcional do meu curso da faculdade.

O objetivo de é criar um programa Haskell que recebe uma lista de códigos de barras de produros e gera um cupom fiscal com o nome do supermercado, a lista dos produtos comprados com nome e preço, e na última linha exibe a soma dos preços dos produtos. 

Exemplo:

Com a entrata: putStrLn(geraRecibo [1234, 3216, 4719,1112,1113,3814])
O programa vai retornar o seguinte resultado:

![image](https://user-images.githubusercontent.com/70992080/118567208-bdd1b700-b74b-11eb-8b30-a6b7f9241def.png)

O programa também pode ser iniciado utilizando a função main executando o seguinte comando no GHCI:
:main

![image](https://user-images.githubusercontent.com/70992080/118567396-1c973080-b74c-11eb-90d0-a9a4fff136d8.png)

Ela vai iniciar a função main do programa, que passa uma lista de códigos para a função "geraRecibo" e o retorno é um cupom de recibo fiscal formatado. Ela utiliza o comando "putStrLn" que faz com que a string retornada pela função geraRecibo seja formatada antes de ser exibida (transforma caracteres como '\n' em quebra de linhas e faz outras mudanças necessárias).
