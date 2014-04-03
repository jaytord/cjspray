<? $this->load->view("pdf_css_view"); ?>

<?php 
	$cj_products = array();
	$graco_products = array();

	$cj_accessories = array();
	$graco_accessories = array();

	$cj_products_total = 0; 
	$graco_products_total = 0; 

	//options
	foreach ($selections["options"] as $key => $value) {
		if( intval( $value["value"]["product_type"]) == 2){
			array_push( $graco_products, $value );
			$graco_products_total += floatval( $value["value"]["graco_price"] );
		} else {
			array_push( $cj_products, $value );
			$cj_products_total += floatval( $value["value"]["graco_price"] );
		}
	}

	//accessories
	foreach ($selections["accessories"] as $key => $value){
		if( intval( $value["product_type"]) == 2){
			array_push( $graco_accessories, $value );
			$graco_products_total += floatval( $value["graco_price"] );
		} else {
			array_push( $cj_accessories, $value );
			$cj_products_total += floatval( $value["graco_price"] );
		}
	}

	//part number
	$ph = "";
	foreach ($selections["options"] as $key => $value) {

		$ph.= ($key.$value["value"]["id"]."-");
	}
?>

<div id="header" class="dealer-header">
	<img src="<?= base_url(); ?>img/dealer_logos/graco.png">
	<img style="float:right" src="<?= base_url(); ?>img/logo.png">
</div>

<div id="main">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
		<tr>
			<td colspan="2">
				<h2><?= substr($ph,0,-1); ?></h2>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="padding-top:20px;">
				<h3>CJ Dealer Price <span style="padding-left:40px;">$<?= number_format( $price["graco"] , 0); ?></span></h3>
			</td>
		</tr>
		<tr>
			<td style="padding-top:20px; vertical-align:top; padding-right:20px;">
				<table id="options" cellspacing="0" cellpadding="0" border="0" width="100%">
					<tr>
						<td class="label">
							<h3>CJ Spray Total</h3>
						</td>
						<td class="price">
							<h3>$<?= number_format( $cj_products_total , 0); ?></h3>
						</td>
					</tr>
					<tr>
						<th colspan="2" class="label" style="padding-top:40px;">
							<h3>Options</h3>
						</th>
					</tr>
					<?php foreach ($cj_products as $key => $value):  ?>
					<tr>
						<td><span class="label"><?= $value["label"]; ?> :</span><?= $value["value"]["label"]; ?></td>
						<td class="price">$<?= number_format($value["value"][$option_price_value], 0); ?></td>
					</tr>
					<?php endforeach ?>
					<tr class="header-row">
						<th colspan="2" class="label" style="padding-top:40px;">
							<h3>Accessories</h3>
						</th>
					</tr>
					<?php foreach ($cj_accessories as $key => $value): ?>
					<tr>
						<td><span class="label"><?= $value["label"]; ?></span></td>
						<td class="price">$<?= number_format($value[$option_price_value], 0); ?></td>
					</tr>
					<?php endforeach ?>
				</table>
			</td>
			<td style="padding-top:20px; padding-left:20px;  border-left:1px solid #666; vertical-align:top">
				<table id="options" cellspacing="0" cellpadding="0" border="0" width="100%">
					<tr>
						<td class="label">
							<h3>Graco Total</h3>
							<h4>(<?= $dealer["type_id"] == 2 ? "40%" : "30%"; ?> Graco Discount)</h4>
						</td>
						<td class="price">
							<h3>$<?= number_format( $graco_products_total , 0); ?></h3>
						</td>
					</tr>
					<tr>
						<th colspan="2" class="label" style="padding-top:40px;">
							<h3>Options</h3>
						</th>
					</tr>
					<?php foreach ($graco_products as $key => $value):  ?>
					<tr>
						<td><span class="label"><?= $value["label"]; ?> :</span><?= $value["value"]["label"]; ?></td>
						<td class="price">$<?= number_format($value["value"][$option_price_value], 0); ?></td>
					</tr>
					<?php endforeach ?>
					<?php if( count($graco_accessories) > 0 ): ?>
					<tr class="header-row">
						<th colspan="2" class="label" style="padding-top:40px;">
							<h3>Accessories</h3>
						</th>
					</tr>
					<?php endif; ?>
					<?php foreach ($graco_accessories as $key => $value): ?>
					<tr>
						<td><span class="label"><?= $value["label"]; ?></span></td>
						<td class="price">$<?= number_format($value[$option_price_value], 0); ?></td>
					</tr>
					<?php endforeach; ?>
				</table>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="padding-top:40px; text-align:center;">
				<img style="vertical-align:top" src="<?= $image_url; ?>" />
			</td>
		</tr>
	</table>
</div>


<?php if($show_footer) $this->load->view("pdf_footer_view"); ?>