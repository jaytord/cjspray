<? $this->load->view("pdf_css_view"); ?>

<? if( !empty($dealer) && !empty($dealer['logo']) ): ?>
<div id="header" class="dealer-header">
	<img height="100" src="<?= base_url(); ?>img/dealer_logos/<?= $dealer['logo']; ?>">
</div>
<? endif; ?>

<div id="main">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" height="100%">
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
					if( !empty($promo["code"]) ){
						$you_price = $price["you"];
					}
				?>
				<table id="options" cellspacing="0" cellpadding="0" border="0" width="100%">
					<?php if( $show_list_price == true && isset( $price["list"] ) ) : ?>
					<tr>
						<td class="label">
							<h4>List Price</h4>
						</td>
						<td class="price">
							<h4>$<?= number_format($price["list"], 0); ?></h4>
						</td>
					</tr>
					<?php endif ?>
					<tr>
						<td class="label">
							<h3><?= $price_label; ?></h3>
						<td class="price">
							<h3>$<?= number_format( $price[$price_value] , 0); ?></h3>
						</td>
					</tr>
					<?php if( $show_promo_price == true && isset($you_price) ) : ?>
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
							<h3>$<?= number_format($you_price, 0); ?></h3>
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
						<td class="price">$<?= number_format($value["value"][$option_price_value], 0); ?></td>
					</tr>
					<?php endforeach ?>
				</table>
			</td>
			<td style="vertical-align:top; padding-top:60px">
				<table id="accessories" cellspacing="0" cellpadding="0" border="0" width="100%">
					<tr>
						<td colspan="2">
							<img style="vertical-align:top" src="<?= $image_url; ?>" />
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
						<td class="price">$<?= number_format($value[$option_price_value], 0); ?></td>
					</tr>
					<?php endforeach ?>
				</table>
			</td>
		</tr>
	</table>
</div>