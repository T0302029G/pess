<!-- Part 1 -->
<?php require_once 'nav.php'; ?>
<br><br>
<?php
if (!isset($_POST["btnSearch"])){
?>
<!-- create a form to search for patrol car based on id -->
<form name="form1" method="post"
action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?> ">
<table class="ContentStyle">
<tr></tr>
<tr>
<td>Patrol Car ID :</td>
<td><input type="text" name="patrolCarId" id="patrolCarId"></td>
<td><input type="submit" name="btnSearch" id="btnSearch" value="Search"></td>
  </tr>
</table>
</form>
<?php
} ?>
		 
<!-- display a form for operator to update status of patrol car -->
<form name="form2" method="post"
  action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?> ">
  <table>
    <tr></tr>
	<tr>
	  <td>ID :</td>
	  <td><?php echo $patrolCarId ?>
	    <input type="hidden" name="patrolCarId" id="patrolCarId"
		value="<?php echo $patrolCarId ?>">
	  </td>
	 </tr>
	 <tr>
	    <td>Status :</td>
		<td><select name="patrolcarStatus" id="patrolcarStatus">
		  <?php foreach( $patrolcarStatusArray as $key => $value){ ?>
		  <option value="<?php echo $key ?>"
		      <?php if ($key==$patrolcarStatusId) {?> selected="selected" 
			  <?php }?>
		  >
		      <?php echo $value ?>
		  </option>
		  <?php } ?>
		</select></td>
		</tr>
		<tr>
		  <td><input type="reset" name="btnCancel" id="btnCancel" value="Reset"></td>
		  <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" name="btnUpdate" id="btnUpdate" value="Update">
		</td>
	   </tr>
	  </table>
	 </form>

<!-- Part 3 -->
<?php
/* if postback via clicking Update button */
if (isset($_POST["btnUpdate"])){
  require_once 'db.php';
  // create database connection
  $conn = new mysqli(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
  // Check connection
  if ($conn->correct_error) {
	  die("Connection failed: " . $conn->connect_error);
  }
  // update patrol car status
  $sql = "UPDATE patrolcar SET patrolcar_status_id = '".$_POST['patrolCarStatus']."' WHERE patrolcar_id = '".$_POST['patrolCarId']."'";
  if ($conn->query($sql)===FALSE) {
	echo "Error: " . $sql . "<br>" . $conn->error;
  }
  /* if patrol car status is Arrived (4) then capture the time of arrival */
  if ($_POST["patrolcarStatus"] == '4'){
	$sql = "UPDATE dispatch SET time_arrived = NOW() WHERE time_arrived is NULL and patrolcar_id = '".$_POST['patrolCarId']."'";
  if ($conn->query($sql)===FALSE) {
	echo "Error: " . $sql . "<br>" . $conn->error;
  }
}
/* else if patrol car status is FREE (3) then capture the time of completion */ else if ($_POST["patrolCarStatus"] == '3'){
	/* First, retrieve the incident ID from dispatch table handled by that patrol car */
	$sql = "SELECT incident_id FROM dispatch WHERE time_completed IS NULL AND patrolcar_id = '".$_POST['patrolCarId']."'";
	$result = $conn->query($sql);
	if ($result = num_rows > 0) {
	  while ($row = $result->fetch_assoc()) {
		$incidentId = $row['incident_id'];
	  }
    }
	// next update dispatch table
	$sql = "UPDATE dispatch SET time_completed = NOW() WHERE time_completed is NULL AND patrolcar_id = '".$_POST['patrolCarId']."'";
    if ($conn->query($sql)===FALSE) {
	  echo "Error: " . $sql . "<br>" . $conn->error;
	}
	/* update incident table to completed (3) all patrol car attended to it are FREE now */
	$sql = "UPDATE incident SET incident_status_id = '3' WHERE incident_id = '$incidentId' AND NOT EXISTS (SELECT * FROM dispatch WHERE time_completed IS NULL AND incident_id = '$incidentId')";
	if ($conn->query($sql)===FALSE) {
	  echo "Error: " . $sql . "<br>" . $conn->error;
	}
  }
  $conn->close();
  ?>
<script type="text/javascript">window.location="./logcall.php";</script>
<?php } ?>