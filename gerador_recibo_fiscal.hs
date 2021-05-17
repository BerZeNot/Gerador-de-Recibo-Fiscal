{-
 Primeiro trabalho de programação
 Título: "Produção de Um Recibo Fiscal em um Supermercado"
 Nome: Paulo Giovany Alves de Oliveira
 Matrícula: 12011BSI250
-}

-- Declaração dos tipos de dados
type Nome = String
type Preco = Int
type CodBar = Int
type BaseDeDados = [(CodBar,Nome,Preco)]
type ListaDeCodigos = [CodBar]
type Recibo = [(Nome,Preco)]

-- função que retorna a lista de produtos cadastrados
listaProdutos :: BaseDeDados
listaProdutos = [(1234,"Oleo DoBom, 1l",195),
 (4756,"Chocolate Cazzeiro, 250g",180),
 (3216,"Arroz DoBom, 5Kg",213),
 (5823,"Balas Pedregulho, 1Kg",379),
 (4719,"Queijo Mineirin, 1Kg",449),
 (6832,"Iogurte Maravilha, 1Kg",499),
 (1112,"Rapadura QuebraDente, 1Kg",80),
 (1111,"Sal Donorte, 1Kg",221),
 (1113,"Cafe DoBom, 1kg",285),
 (1115,"Biscoito Bibi, 1Kg",80),
 (3814,"Sorvete QGelo, 1l",695)]

-- função que define o tamnho máximo da linha que mostra o nomeProduto........preço
tamLinha :: Int
tamLinha = 30

-- Função que retorna o preço em centavos formatado
formataCentavos :: Preco -> String
formataCentavos p = real(p) ++ "." ++ cent(p)
 where
-- função que retorna a primeira parte do preço
  real :: Int -> String
  real num = show(num `div` 100)

-- função que retorna a segunda parte do preço
  cent :: Int -> String
  cent num = show(num `rem` 100)

-- função para formatar a linha com o nome e o preço do produto
formataLinha :: (Nome,Preco) -> String
formataLinha(n,p) = n ++ getSeparator((tamLinha - (tamStr(n)+tamNum(p)))) ++ formataCentavos(p)

-- função que retorna uma string com a quantidade necessária de caracteres reparadores 
-- para a formatação da linha. Essa função tem uso parecido com a "replicate" do Haskell,
-- porem ela retorna somente o separador '.' que será usado na lista
getSeparator :: Int -> String
getSeparator x
 | x == 0 = ""
 | x<=2 = " "
 | otherwise = '.' : getSeparator (x-1)

-- função que retorna o tamanho de uma String
tamStr :: String -> Int
tamStr n = length n
-- função que retorna o tamanho de um Int
tamNum :: Int -> Int
tamNum x = length(show(x))

-- função que formata as linhas de produtos do recibo
formataLinhas :: [(Nome,Preco)] -> String
formataLinhas [] = ""
formataLinhas (x:xs) = formataLinha(x)++ "\n" ++ formataLinhas(xs)

-- função que gera o valor total do recibo
geraTotal :: Recibo -> Preco
geraTotal [] = 0
geraTotal ((n,p):xs) = p + geraTotal(xs)

-- função que formata o falor total do recibo
formataTotal :: Preco -> String                                                      -- 1 = quantidade de caracteres extras('$')
formataTotal t = "Total" ++ getSeparator(tamLinha - (length("Total") + tamNum(t) + 1) )++ "$" ++formataCentavos(t)

-- função que formata o recibo
formataRecibo :: Recibo -> String
formataRecibo ((n,p):xs) = nomeSuperMcd ++ formataLinhas(((n,p):xs)) ++ formataTotal(geraTotal(((n,p):xs)))
 where
  -- função que retorna o nome do supermercado
  nomeSuperMcd :: String
  nomeSuperMcd = "Supermercado QLegal\n"

-- função que faz a busca de um produto na base de dados
acha :: BaseDeDados -> CodBar -> (Nome,Preco)
acha [] _ = ("Null",0)
acha ((c,n,p):xs) cBar
 | c == cBar = (n,p)
 | otherwise = acha xs cBar

-- função que faz interface entre o construtor de recibos e a base de dados
achaItem :: CodBar -> (Nome, Preco)
achaItem i = acha listaProdutos i

-- função que transforma uma lista de códigos em uma lista (Nome, Preco)
fazRecibo :: ListaDeCodigos -> Recibo
fazRecibo [] = []
fazRecibo (x:xs) = achaItem(x) : fazRecibo xs

-- função que constroi o recibo final
geraRecibo :: ListaDeCodigos -> String
geraRecibo lc = formataRecibo(fazRecibo lc)

-- função principal que chama o construtor de recibos passando um valor
main :: IO ()
main = do
 putStr(geraRecibo [1234, 3216, 4719,1112,1113,3814])
 y <- getLine
 putStrLn("End")