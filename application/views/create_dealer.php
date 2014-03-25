<?php ?>

<div>
	<h3>Create Dealer</h3>
	<form action="<?= base_url(); ?>dealers/create" method="post">
		<?php foreach ($fields as $key => $value): if($value["shown"]==true): ?>
		<input name="<?= $key; ?>" type="<?= $value["type"] ?>" placeholder="<?= $value["label"]; ?>"></input>
		<?php endif; endforeach; ?>
		<input type="submit"></input>
	</form>
</div>