<?php
require_once "database.php";
require_once "csrf.php";

$csrf = new CSRF_Protect();

$mysqli = get_database();

if($mysqli->connect_errno){
	echo('<div class="error">Database offline.</div>');
}elseif(!($statement = $mysqli->prepare("select task_id, latitude, longitude, task_name, is_complete, created from tasks where user_id = ?"))){
	echo('<div class="error">Error in MySQLi engine [stage 1].</div>');
}elseif(!$statement->bind_param('s', $_SESSION['user_id'])){
	echo('<div class="error">Error in MySQLi engine [stage 2].</div>');
}elseif(!$statement->bind_result($dbtaskid, $dblatitude, $dblongitude, $dbtaskname, $dbiscomplete, $dbcreated)){
	echo('<div class="error">Error in MySQLi engine [stage 3].</div>');
}elseif(!$statement->execute()){
	echo('<div class="error">Error in MySQLi engine [stage 4].</div>');
}else{
?>
<table id="taskstable">
	<!--
	<tr>
		<th>Task Name</th>
		<th>Latitude</th>
		<th>Longitude</th>
		<th>Created</th>
		<th>Completed</th>
		<th>Update</th>
		<th>Delete</th>
	</tr>
	-->
<?php
    while($statement->fetch()){
?>
<!--
<div class="fartask">
	<?=$dbtaskname?><span class="dash" onclick="minimize(this.parentnode.id, this, this.parentNode)">—</span>
	<span class="ex" onclick="popup(this.parentnode.id)">X</span><br/>
	<span class="loc"><?=$dblatitude?>, <?=$dblongitude?></span>
</div>
-->
	<tr>
		<form method="post" action="actions/modify_task.php">
			<? $csrf->echoInputField(); ?>
			<input type="hidden" name="task_id" value="<?=$dbtaskid?>"/>
			<td class="td_taskname"><input class="td_tasknamebox" type="text" name="name" value="<?=$dbtaskname?>"/></td><br/>
			<td class="td_latitude"><input class="td_latitudebox" type="number" step="0.0001" name="latitude" value="<?=$dblatitude?>"/></td>
			<td class="td_longitude"><input class="td_longitudebox" type="number" step="0.0001" name="longitude" value="<?=$dblongitude?>"/></td>
			<td class="td_created"><?=$dbcreated?></td>
			<td class="td_completed"><input class="td_completebox" type="checkbox" name="complete"<?=($dbiscomplete == 1 ? " checked" : "")?>/></td>
			<td class="td_update"><input class="td_submitbutton" type="submit" value="Update"/></td>
		</form>
		<form method="post" action="actions/delete_task.php">
			<? $csrf->echoInputField(); ?>
			<input type="hidden" name="task_id" value="<?=$dbtaskid?>"/>
			<td class="td_delete"><input class="td_deletebutton" type="submit" value="Delete"/></td>
		</form>
	</tr>
<?php
	}
	$statement->close();
}
?>
</table>