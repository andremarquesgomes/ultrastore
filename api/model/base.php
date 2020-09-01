<?php 

class Base {
    
    public $db; 

    public function __construct(){
        $this->db = new PDO("mysql:host=localhost;dbname=ultrashop;charset=utf8mb4" , "root", ""); 
    }

    public function sanitize($data){
        foreach($data as $key =>$value) {
            $data[$key] = strip_tags(trim($value)); 
        }

        return $data; 
    }
}