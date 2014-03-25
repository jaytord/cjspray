<h3>Wait! Are you sure you want to <?php echo $action; ?>?</h3>

<form action="/admin/<?php echo $action; ?>" method="post">
	<input type="hidden" name="confirm" value="1">
	<input type="submit" value="Yep. Do it."></input>
</form>
<form action="/admin/<?php echo $action; ?>" method="post">
	<input type="hidden" name="confirm" value="0">
	<input type="submit" value="Hell No. Go Back."></input>
</form>