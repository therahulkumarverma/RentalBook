<!-- req.jsp -->
<head><meta http-equiv="CACHE-CONTROL" content="NO-CACHE" /> <meta http-equiv="PRAGMA" content="NO-CACHE" />
	<meta http-equiv="EXPIRES" content="0" /></head>
	<form action="register" method="post">

		<div class="form-group">
			<label for="">Name</label> <input type="text" class="form-control"
			id="exampleInputEmail1" aria-describedby="emailHelp"
			placeholder="Enter name" name="name"> <label
			for="exampleInputEmail1">Email address</label> <input type="text"
			class="form-control" id="exampleInputEmail1"
			aria-describedby="emailHelp" placeholder="Enter email" name="email">
			<label for="exampleInputEmail1">Phone</label> <input type="text"
			class="form-control" id="exampleInputEmail1"
			aria-describedby="emailHelp" placeholder="Enter phone" name="phone">
			<label for="exampleInputEmail1">Address</label> <input type="text"
			class="form-control" id="exampleInputEmail1"
			aria-describedby="emailHelp" placeholder="Enter Address"
			name="address"> <label for="exampleInputEmail1"> DOB</label>
			<input type="date" class="form-control" id="exampleInputEmail1"
			aria-describedby="emailHelp" placeholder="select dob" name="dob">
			<label>Gender</label> <select name="gender" class="form-control"
			value="<?php echo $gender; ?>" name="gender">
			<option>Male</option>
			<option>Female</option>
		</select> <label for="exampleInputEmail1">Password</label> <input
		type="password" class="form-control" id="exampleInputEmail1"
		aria-describedby="emailHelp" placeholder="Enter password"
		name="password"> <label for="exampleInputEmail1">Confirm
		Password</label> <input type="password" class="form-control"
		id="exampleInputEmail1" aria-describedby="emailHelp"
		placeholder="Confirm password" name="password">


	</div>


	<div class="form-check">
		<input type="checkbox" class="form-check-input" id="exampleCheck1"
		name="check"> <label class="form-check-label"
		for="exampleCheck1">Terms & Condition</label>
	</div>
	<button type="submit" class="btn btn-primary" name="submit">Submit</button>
</form>
