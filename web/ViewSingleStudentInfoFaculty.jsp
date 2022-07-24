    <%@page import="dto.ManagerDto"%>
<%@page import="dao.ManagersDao"%>
<%@page import="dao.IndividualStudentDao"%>
<%@page import="dao.GetCountInfo"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Iterator"%>
<%@page import="dto.StudentDto"%>
<%@page import="dto.StudentDto"%>
<%@page import="java.util.List"%>
<%@page import="dao.StudentDao"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <style>
    body {
    background: #67B26F;  /* fallback for old browsers */
    background: -webkit-linear-gradient(to right, #4ca2cd, #67B26F);  /* Chrome 10-25, Safari 5.1-6 */
    background: linear-gradient(to right, #4ca2cd, #67B26F); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
    padding: 0;
    margin: 0;
    font-family: 'Lato', sans-serif;
    color: #000;
}      
.student-profile .card {
    border-radius: 10px;
}
.student-profile .card .card-header .profile_img {
    width: 150px;
    height: 150px;
    object-fit: cover;
    margin: 10px auto;
    border: 10px solid #ccc;
    border-radius: 50%;
}
.student-profile .card h3 {
    font-size: 20px;
    font-weight: 700;
}
.student-profile .card p {
    font-size: 16px;
    color: #000;
}
.student-profile .table th,
.student-profile .table td {
    font-size: 14px;
    padding: 5px 10px;
    color: #000;
}

      </style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Area | Dashboard</title>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <script src="http://cdn.ckeditor.com/4.6.1/standard/ckeditor.js"></script>
  </head>
  <body>
<%
    String unique_key = (String)session.getAttribute("unique_key");
    String id = (String)session.getAttribute("id");
         System.out.println(unique_key);
    
    if( unique_key==null || !unique_key.equals("faculty"))
    {
        session.invalidate();
        response.sendRedirect("login.jsp");
    }
    

String enrollment =(String)session.getAttribute("enrollment");
System.out.println("single"+    enrollment);
IndividualStudentDao iStudent = new IndividualStudentDao();
StudentDto students = new StudentDto();
students = iStudent.getIndividualStudentData(enrollment);


%>
  <%@ include file="headerFaculty.jsp" %>
   

           
          </div>            


                  <div class="col-md-10">
            
            <div class="panel panel-default">
              <div class="panel-heading main-color-bg">
                <h3 class="panel-title">Website Overview</h3>
              </div>
                 <form method="post" action="IdManData">
<div class="panel-body">
                  <div class="student-profile py-4">
  <div class="container">
    <div class="row">
      <div class="col-lg-2">
        <div class="card shadow-sm">
          <div class="card- header bg-transparent text-center"><h3><%= students.getStudent_name() %></h3></div>
          <div class="card-body">
            <p class="mb-0" name="manager_id"><strong class="pr-1">Enrollment:</strong><%= students.getEnrollment_number() %></p>
            <p class="mb-0" name="category"><strong class="pr-1">Branch:</strong><%= students.getBranch() %></p>
            <p class="mb-0"><strong class="pr-1">Email :</strong><%= students.getEmail() %></p>
          </div>
        </div>
      </div>
      <div class="col-lg-6">
        <div class="card shadow-sm">
          <div class="card-header bg-transparent border-0">
            <h3 class="mb-0"><i class="far fa-clone pr-1"></i>General Information</h3>
          </div>
          <div class="card-body pt-0">
             
            <table class="table table-bordered">
               <tr>
                <th width="30%">Enrollment Number</th>
                <td width="2%">:</td>
                <td><%= students.getEnrollment_number() %></td>
              </tr>
                <tr>
                <th width="30%">Full Name</th>
                <td width="2%">:</td>
                <td><%= students.getStudent_name() %></td>
              </tr>
              <tr>
                <th width="30%">Date Of Birth</th>
                <td width="2%">:</td>
                <td><%= students.getDob() %></td>
              </tr>
              <tr>
                <th width="30%">Gender</th>
                <td width="2%">:</td>
                <td><%= students.getGender() %></td>
              </tr>
              <tr>
                <th width="30%">Mobile</th>
                <td width="2%">:</td>
                <td><%= students.getMobile() %></td>
              </tr>
              <tr>
                <th width="30%">Address</th>
                <td width="2%">:</td>
                <td><%= students.getAddress() %></td>
              </tr>
                <tr>
                <th width="30%">Course</th>
                <td width="2%">:</td>
                <td><%= students.getCourse() %></td>
              </tr>
                <tr>
                <th width="30%">Branch</th>
                <td width="2%">:</td>
                <td><%= students.getBranch() %></td>
              </tr>
                <tr>
                <th width="30%">Aadhar</th>
                <td width="2%">:</td>
                <td><%= students.getAadhar() %></td>
              </tr>
                <tr>
                <th width="30%">Adminssion Year</th>
                <td width="2%">:</td>
                <td><%= students.getAdmission_year() %></td>
              </tr>
                <tr>
                <th width="30%">Blood Group</th>
                <td width="2%">:</td>
                <td><%= students.getBlood_group() %></td>
              </tr>
                
            </table>
          
        </div>
         <div style="height: 26px"></div>
        <div class="card shadow-sm">
         
          <div class="card-body pt-0">
                <a href="ViewStudentFaculty.jsp" >Back</a>
              </form>
              
            
             
          </div>
        </div>
            
              </div>
      </div>
    </div>
  </div>
</div>  
</div>
                 
              </div>

          </div>
        </div>
      </div>
 
    </section>

    <footer id="footer">
      <p>Copyright AdminStrap, &copy; 2017</p>
    </footer>
  <%@ include file="footerFaculty.jsp" %>
   