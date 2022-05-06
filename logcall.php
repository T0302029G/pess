<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Police Emergency Service System</title>
<link href="header_style.css" rel="stylesheet" type="text/css">
<link href="content_style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
function validateForm()
{
	var x=document.forms["frmLogCall"]["callerName"].value;
	if (x==null || x=="")
	{
		alert("Caller Name is required.");
		return false;
	}
	// may add code for validating other inputs
}
</script>
</head>
<body>
<?php // import nav.php
require_once 'nav.php';
?>
<?php 
// connect to a database
require_once 'db.php';

// Create connection
$conn = new mysqli(DB_SERVER, DB_USER, DB_PASSWORD, DB_DATABASE);
// Check connection
if ($conn->connect_error) {
	die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM incident_type";

$result = $conn->query($sql);

if ($result->num_rows > 0) {
	while ($row = $result->fetch_assoc()){
	/* create an associative array of $incidentType {incident_type_id, incident_ty;e_desc] */
	$incidentType[$row['incident_type_id']] = $row['incident_type_desc'];
	$incidentType['010']= 'Fire';
	$incidentType['020']= 'Riot';
	$incidentType['030']= 'Burglary';
	$incidentType['040']= 'Domestic Violent';
	$incidentType['050']= 'Fallen Tree';
	$incidentType['060']= 'Traffic Accident';
	$incidentType['070']= 'Loan Shark';
	$incidentType['999']= 'Others';
    }
}
$conn->close();
?>

<form name="frmLogCall" method="post"
    onsubmit="return validateForm()"action="dispatch.php">
<table class="ContentStyle">
  <tr>
    <td colspan="2">Log Call Panel</td>
  </tr>
  
  <tr>
    <td>Caller's Name :</td>
	<td><input type="text" name="callerName" id="callerName"></td>
  </tr>
  <tr>
    <td>Contact No :</td>
	<td><input type="text" name="contactNo" id="contactNo"></td>
  </tr>
  <tr>
    <td>Location :</td>
	<td><input type="text" name="location" id="location"></td>
  </tr>
  <tr>
    <td>Incident Type :</td>
	<td>
	  <select name="incidentType" id="incidentType">
	  <?php // populate a combo box with $incidentType
	      foreach( $incidentType as $key => $value){
	  ?>
	          <option value="<?php echo $key ?>">
			      <?php echo $value ?>
			  </option>
	  <?php
	      }
	  ?>
	  </select>
	</td>
  </tr>
  <tr>
    <td>Description :</td>
	<td><textarea name="incidentDesc" id="incidentDesc" cols="45" rows="5"></textarea>
	</td>
  </tr>
  <tr>
    <td><input type="reset" name="btnCancel" id="btnCancel" value="Reset"></td>
	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit"
	    name="btnProcessCall" id="btnProcessCall" value="Process Call...">
	</td>
  </tr>
</table>
</form>
</body>
</html>