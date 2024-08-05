<!-- addcategory.jsp -->

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Admin: Add Category</title>
	<%@include file="allCss.jsp"%>

	<style>




	</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<table>
		<div class="container mt-3">
			<div class="row">
				<div class=" col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<h4>Add Category</h4>


							</div>

							<!--  -->


							<form action="../addCategory" method="post">

								<div class="form-group">
									<label for="">Category Name</label> 
									<input type="text" name="categoryname"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter name"
									name="name" required><br>
									<button type="submit" class="btn btn-primary" name="submit">Submit</button>
									<a href="deleteCategory.jsp"><b style="color:red;"></b></a>
								</form>


							</div>
						</div>
					</div>


				</div>

			</div>

		</table>

		<div style="width:120%;margin-top:290px;"><%@include file="footer.jsp" %></div> 
	</body>
	</html>