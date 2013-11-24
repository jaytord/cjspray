<style type="text/css">
	@page {
		margin-top: 0cm;  
		margin-left: 0cm;  
		margin-right: 0cm;
		margin-bottom: 1.5cm;    
	}
	body{
		font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
		border-bottom:#004A80 20px solid;
	}
	#main{
		padding:30px;
	}
	div#header{
		border-top:#004A80 12px solid;
		width: 100%;
		padding:20px 20px 15px 30px;
	}
	div#subhead{
		background: #004A80;
		padding: 4px 4px 4px 34px;
		width: 100%;
		color: #FFF;
		font-weight: 100;
		font-size: 16px;
	}
	.price{
		text-align: right;
		vertical-align: top;
	}
	.label{
		text-align: left;
	}
	#accessories{
		padding-left: 20px;
	}
	h4{
		font-weight: 100;
	}
	#footer{
		position: fixed;
		bottom:0;
	}
</style>

<div id="header"><img width="180" src="<?php echo base_url(); ?>img/logo.png"></div>
<div id="subhead">Mobile Spray Rigs</div>
<div id="main">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td colspan="2">
			<h2>
				<?php
					$ph = "";
					foreach ($selections["options"] as $key => $value) {
						$ph.= ($key.$value["value"]["id"]."-");
					}
					echo substr($ph,0,-1);
				?>
			</h2>
		</td>
	</tr>
	<tr>
		<td style="width:50%; padding-top:60px">
			<?php 
				$dealer_cj_price = empty($dealer) ? $price["cj"] : $price["dealer"] ; 

				if( !empty($promo["code"]) ){
					$you_price = $price["you"];
				}
			?>
			<table id="options" cellspacing="0" cellpadding="0" border="0" width="100%">
				<tr>
					<td class="label">
						<h4>List Price</h4>
					</td>
					<td class="price">
						<h4>$<?= number_format($price["list"],2); ?></h4>
					</td>
				</tr>
				<tr>
					<td class="label">
						<h3><?= empty($dealer) ? "CJ Price" : "Dealer Price"; ?></h3>
					</td>
					<td class="price">
						<h3><?= number_format( $dealer_cj_price , 2); ?></h3>
					</td>
				</tr>
				<?php if( isset($you_price) ) : ?>
				<tr>
					<td class="label">
						<h4>Promo code: <?= $promo["code"]; ?></h4>
					</td>
					<td class="price">
						<h4>-<?= $promo["discount"]*100; ?>%</h4>
					</td>
				</tr>
				<tr>
					<td class="label">
						<h3>Your Price</h3>
					</td>
					<td class="price">
						<h3>$<?= number_format($you_price,2); ?></h3>
					</td>
				</tr>
				<?php endif ?>
				<tr>
					<th colspan="2" class="label" style="padding-top:40px;">
						<h3>Options</h3>
					</th>
				</tr>
				<?php foreach ($selections["options"] as $key => $value):  ?>
				<tr>
					<td><span class="label"><?= $value["label"]; ?> :</span><?= $value["value"]["label"]; ?></td>
					<td class="price">$<?= number_format($value["value"]["list_price"], 2); ?></td>
				</tr>
				<?php endforeach ?>
			</table>
		</td>
		<td style="vertical-align:top; padding-top:60px">
			<table id="accessories" cellspacing="0" cellpadding="0" border="0" width="100%">
				<tr>
					<td colspan="2">
						<img style="vertical-align:top" src="<?php echo $image_url; ?>" />
					</td>
				</tr>
				<tr class="header-row">
					<th colspan="2" class="label" style="padding-top:40px;">
						<h3>Accessories</h3>
					</th>
				</tr>
				<?php foreach ($selections["accessories"] as $key => $value): ?>
				<tr>
					<td><span class="label"><?= $value["label"]; ?></span></td>
					<td class="price"><?= number_format($value["list_price"], 2); ?></td>
				</tr>
				<?php endforeach ?>
			</table>
		</td>
	</tr>
</table>
</div>