<?php

	require("config.php");

	// print_r($_POST); // Veio do formulario
	if(
		isset($_POST["send"]) &&
		isset($_POST["quantity"]) &&
		isset($_POST["product_id"]) &&
		is_numeric($_POST["quantity"]) &&
		is_numeric($_POST["product_id"]) &&
		$_POST["quantity"] > 0
	) {

		$query = $db->prepare("
		SELECT price, name, image, product_id, stock
		FROM products
		WHERE product_id = ? AND stock >= ?
		");

		$query->execute([
			$_POST["product_id"],
			$_POST["quantity"]
		]);

		$product = $query->fetchAll( PDO::FETCH_ASSOC );

		if(!empty($product)){

			/* Só adicionamos ao carrinho após validar várias coisas */
			$_SESSION["cart"][$product[0]["product_id"]] = [
				"quantity" => (int)$_POST["quantity"], 
				"product_id" => $product[0]["product_id"],
				"name" => $product[0]["name"],
				"price" => $product[0]["price"],
				"stock" => $product[0]["stock"]
			];
		}
	}

	//echo "<pre>";
	//print_r($_SESSION["cart"]);
?>

<!DOCTYPE html>
<html lang="pt">
<head>
	<meta charset="UTF-8">
	<title> Ultra Shop - Carrinho</title>
	<style>
	
		table, tr, td, th {
			border: 1px solid black;
			border-collapse: collapse;
		}
	</style>
	<script>
	
		document.addEventListener("DOMContentLoaded", () => {
			const quantityFields = document.querySelectorAll(".quantity");
			const buttonsDelete = document.querySelectorAll(".delete");

			for(let field of quantityFields){

				field.addEventListener("change", () => {

					let postData = "request=changeQuantity&quantity="+field.value+"&product_id="+field.parentNode.parentNode.dataset.product_id;

					fetch("requests.php", {
						"method":"POST",
						"headers":{
							"Content-Type":"application/x-www-form-urlencoded"
						},
						"body":postData,
						"credentials":"same-origin"
					})
					.then(response => response.json())
					.then(json => console.log(json));

				});
			}

			for(let button of buttonsDelete){

				button.addEventListener("click", () => {

					let removeData = "request=removeProduct&product_id="+button.parentNode.parentNode.dataset.product_id;

					fetch("requests.php", {
						"method":"POST",
						"headers":{
							"Content-Type":"application/x-www-form-urlencoded"
						},
						"body":removeData,
						"credentials":"same-origin"
					})
					.then(response => response.json())
					.then(json => console.log(json));

					button.parentNode.parentNode.remove();
				});

			}

		});

	</script>
</head>
<body>
	<?php 
		if(isset($_SESSION["cart"])){
	?>	
			<table>
				<tr>
					<th>Artigo</th>
					<th>Quantidade</th>
					<th>Preço</th>
					<th>Total</th>
					<th></th>
				</tr>

				<?php

				$total = 0;
				
				foreach($_SESSION["cart"] as $item) {
					
					$subtotal=$item["price"]*$item["quantity"];
					//Custom Data Field --> data-product_id
					echo'
					<tr data-product_id = "'.$item["product_id"].'">
						<td>'.$item["name"].'</td>
						<td><input type = "number" class="quantity" value="'.$item["quantity"].'" min = 1 
							max='.$item["stock"].'></td>
						<td>'.$item["price"].'€</td>
						<td>'.$subtotal.'€</td>
						<td>
							<button type="button" class="delete">x</button>
						</td>
					</tr>

					';

					$total += $subtotal;

				}
				
				?>

				<tr>
					<td colspan="3"></td>
				    <td><?php echo $total; ?>€</td>
					<td></td>
				</tr>

			</table>
			<nav>
				<a href="./">Voltar ao Ínicio</a>
				<a href="checkout.php">Finalizar a compra</a>
			</nav>
	<?php
		}else {
			echo "Ainda não tem artigos adicionados";
		}
	?>
</body>
</html>
