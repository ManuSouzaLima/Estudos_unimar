# Aula de Boostrap

## Criando um card
    <div class="container">
            <div class="card" style="width: 180px;">
                <img src="img/footwear-5408643_1280.jpg" class="card-img-top">
                <div class="card-body text-center">
                    <h5 class="card-title">Air Jordan 1 "royal"</h5>
                    <p class="card-text">R$ 400 no pix</p>
                    <a href="" class="btn btn-primary w-100 fw-bold">
                        comprar
                    </a>
                </div>
            </div>
        </div>
### Resultado
[imagem do jordan](image.png)


## Tornando responsivo
    <div class="container">
            <div class="row">
                <div class="col-sm-6 col-lg-3">
                    Vitrine 1
                </div>
                <div class="col-sm-6 col-lg-3">
                    Vitrine 2
                </div>
                <div class="col-sm-6 col-lg-3">
                    Vitrine 3
                </div>
                <div class="col-sm-6 col-lg-3">
                    Vitrine 4
                </div>

            </div>
        </div>

### o que acontece?
    neste código acima ele da uma limitação, ele coloca a primeira div indo até 6 colunas e adiciona resposividade quando chegar a limitação de 3.
    No limite é 12 colunas que a tela tem, sendo assim, com duas divs com 6 colunas eu posso ter em uma linha 2 itens, no caso acima, duas vitrines
    Como tenho a vitrine 3 e 4 também ocupando 6 cada, acima como as duas ja bateram o limite de 12 colunas, a vitrine 3 e 4 ficará na linha de baixo.
