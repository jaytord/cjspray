<?php ?>

<div>
	<h3>Create Dealer</h3>
	<table border="1">
		<tr>
			<?php foreach ($fields as $field_id => $field) : ?>
			<th id="<?= $field_id; ?>"><?= $field["label"]; ?></th>
			<?php endforeach; ?>
		</tr>
		<?php foreach ($users as $key => $user): ?>
		<tr data-index="<?php echo $user->index; ?>">
			<?php foreach ($user as $user_key => $user_val) : ?>
			<td id="<?= $user_key; ?>"><?= $user_val; ?></td>
			<?php endforeach; ?>
		</tr>
		</td>
		<?php endforeach; ?>
	</table>
</div>