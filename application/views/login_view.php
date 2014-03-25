<?php ?>

<div>
	<h3>Login</h3>
	<form action="<?= base_url(); ?>auth/login" method="post">
		<input name="username" type="text" placeholder="name"></input>
		<input name="password" type="password" placeholder="password"></input>
		<input type="submit"></input>
	</form>
</div>