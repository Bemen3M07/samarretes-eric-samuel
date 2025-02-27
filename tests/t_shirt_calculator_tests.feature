Feature: Càlcul del preu de samarretes

  Com a usuari
  Vull poder calcular el preu de samarretes amb diferents talles i descomptes
  Per tal de saber quant haig de pagar

    Petita = 10€
    Mitjana = 12€
    Gran = 15€

    Scenario: L'usuari introdueix lletres en comptes de números
        Given l'usuari introdueix lletres en comptes de números
        Then no hauria de calcular res

    Scenario: Càlcul del preu de samarretes sense descompte ni talla
        Given l'usuari escriu "10" samarretes
        When l'usuari no tria talla
        And no hi ha descompte
        Then no hauria de calcular res

    Scenario: Càlcul del preu de samarretes amb descompte 10% i sense talla
        Given  l'usuari escriu "10" samarretes
        When l'usuari no tria talla
        And el descompte de la samarreta és del 10%
        Then no hauria de calcular res

    Scenario: Càlcul del preu de samarretes sense descompte i amb talla
        Given l'usuari escriu "10" samarretes
        When la talla de la samarreta és la Petita
        And no hi ha descompte
        Then el preu de la samarreta és de 10 euros

    Scenario: Càlcul del preu de samarretes amb descompte 10% i amb talla
        Given l'usuari escriu "1" samarreta
        When la talla de la samarreta és la Petita
        And el descompte de la samarreta és del 10%
        Then el preu de la samarreta és de 9 euros

    Scenario: Mostra el text d'alerta descompte de 10%
        Given l'usuari escriu "1" samarreta
        When la talla de la samarreta és la Petita
        And el descompte de la samarreta és del 10%
        Then el text d'alerta és "Descompte del 10% aplicat"

    Scenario: Càlcul del preu de samarretes amb descompte per quantitat i amb talla
        Given l'usuari escriu "10" samarretes
        When la talla de la samarreta és la Petita
        And el descompte de la samarreta és per quantitat
        Then el preu de la samarreta és de 80 euros

    Scenario: Mostra el text d'alerta descompte per quantitat
        Given l'usuari escriu "10" samarretes
        When la talla de la samarreta és la Petita
        And el descompte de la samarreta és per quantitat
        Then el text d'alerta és "Descompte per quantitat aplicat"

    Scenario: L'usuari clica 2 talles diferents
        Given l'usuari escriu "10" samarretes
        When l'usuari tria la talla de la samarreta és la Petita
        And l'usuari tria la talla de la samarreta és la Mitjana
        Then la talla de la samarreta és la Mitjana
        And el preu de la samarreta és de 120 euros

    Scenario: L'usuari selecciona 2 descomptes diferents
        Given l'usuari escriu "10" samarretes
        And la tallad e la samarreta es la Gran
        When l'usuari tria el descompte de la samarreta és per quantitat
        And l'usuari tria el descompte de la samarreta és del 10%
        Then el descompte de la samarreta és del 10%
        And el preu de la samarreta és de 135 euros
