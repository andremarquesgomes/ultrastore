<?php 
header("content-Type: application/json"); 

$url_parts = explode("/", $_SERVER["REQUEST_URI"] ); 

$models = ["users", "products", "orders"]; 

if(isset($url_parts[4]) && in_array($url_parts[4], $models)){
    $model = $url_parts[4];
    
    if(isset($url_parts[5]) && is_numeric($url_parts[5])){
        $id = $url_parts[5]; 
    }

    require("model/".$model.".php");
    $className = ucwords($model); 
    $classModel = new $className(); 
    
    if($_SERVER["REQUEST_METHOD"] === "GET"){

        if(!empty($id)) {
            $data = $classModel->getItem($id); 

            if(empty($data)){
                header("HTTP/1.1 404 Not Found");             
            }
        }
        else{
            $data = $classModel->getList();
            
        }
    }

    elseif($_SERVER["REQUEST_METHOD"] === "POST"){
        $input = json_decode(file_get_contents("php://input"), true); 

        if(!empty($input)){
            $data = $classModel->create( $input);
        }
        else{
            header("HTTP/1.1 400 Bad Resquest"); 
        }

        

    }

    elseif($_SERVER["REQUEST_METHOD"] === "PUT"){
        $input = json_decode(file_get_contents("php://input"), true); 
        $input["id"] = $id; 
        if(!empty($input)){
            $data = $classModel->UPDATE( $input);
        }
        else{
            header("HTTP/1.1 400 Bad Resquest"); 
        }

        

    }
    echo json_encode($data); 
    
} 
