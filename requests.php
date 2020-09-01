<?php

session_start();

header("Content-Type: application/json");



    if(isset($_POST["request"])) {

        if(
            $_POST["request"] === "changeQuantity" && 
            (int)$_POST["quantity"] > 0 &&
            is_numeric($_POST["product_id"]) &&
            isset($_SESSION["cart"][$_POST["product_id"]]) &&
            $_SESSION["cart"][$_POST["product_id"]]["stock"] >= $_POST["quantity"] 
        ){
            /* Atribuir a novo valor da quantity que nos foi passado pela variavel $_POST ao valor anterior, 
            guardado na $_SESSION
            
            $_SESSION["cart"][$_POST["product_id"]]["quantity"] --> VALOR ANTIGO
            
            $_POST["quantity"]  --> VALOR NOVO
    
            */
    
            $_SESSION["cart"][ (int)$_POST["product_id"] ]["quantity"] = (int)$_POST["quantity"];

            echo '{"status":"OK"}';
    
        } else if(
            $_POST["request"] === "removeProduct" && 
            is_numeric($_POST["product_id"]) &&
            isset($_SESSION["cart"][$_POST["product_id"]]
        )){
            
            unset($_SESSION["cart"][ (int)$_POST["product_id"] ]);
        
            /*Verificar se era o ultimo produto */
            if(empty($_SESSION["cart"])){
                unset($_SESSION["cart"]);
            }

            echo '{"status":"OK"}';

        }else {

            echo '{"status":"error"}';
        }
    } else {

        echo '{"status":"error"}';
    }

    
   


?>