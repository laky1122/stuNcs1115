<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="root" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>우리반 파이팅</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<style>
  @import url('https://fonts.googleapis.com/css2?family=Hahmlet&display=swap');
</style>
	<style type="text/css">
		*{
			font-family: 'Hahmlet', serif;
		}
		.row{
			 margin:0 auto;
 			margin-top:40px;
		}
		.one{
			background-color: #F6F6F6;

			box-shadow: 0 0 10px #BDBDBD;
			padding:20px 30px;
			border-radius: 20px;
			height:500px;
		}
		.flex{
			display: flex;
			flex-direction: column; 
			justify-content: center;
			justify-content: space-around;
		}
	</style>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#deletebtn').on('click',function(e){
			e.preventDefault();
			
			var result = confirm("${info.stuName } 학생의 정보를 정말 삭제하시겠습니까?")
			
			if(result){
				$('#deletefrm').submit();
			}
			
		})
	})
	</script>
</head>
<body>

 	<form id="fr" method="get">
 		<input type="hidden" name="search" value="${cri.search }"/>
 	</form>
	<form action="${root }/main/delete" id="deletefrm" method="post">
    	<input type="hidden" class="form-control" id="stuIdx" name="stuIdx" value="${info.stuIdx }">
  	</form>
  	  
  	  
  	  
  	  
  	  
	<div class="container">
	<div class="row">
		<h2><a href="${root }">학생 정보 검색</a></h2>
	</div>
	<div class="row">
		<!--  왼쪽 화면 -->
		<div class="col-xs-6">
			<div class="one" >
				<div style="display: flex; flex-direction: column; gap:10px">	
				 	<form method="get">
				   		<div class="input-group">
				     		<input type="text" class="form-control" placeholder="이름 검색" name="search" value="${cri.search }">
				     		<div class="input-group-btn">
				       			<button class="btn btn-default" type="submit"><i class="glyphicon glyphicon-search"></i></button>
				     		</div>
				   		</div>
				 	</form>
				 	
				 	<!-- 검색결과 시작 -->
				 	<div>
				 		<!-- 결과가 있을 시 -->
						<table class="table table-hover">
						    <thead>
								<tr>
								  <th>번호</th>
								  <th>이름</th>
								  <th></th>
								</tr>
						    </thead>
						    <tbody>
						    <c:forEach var="li" items="${li }" >
						    	<tr>
								  <td>${li.stuIdx }</td>
								  <td>${li.stuName }</td>
								  <td style="text-align:right" class="getInfo">
									<a href="${root }/main/list?search=${cri.search}&stuIdx=${li.stuIdx }" class="btn btn-primary btn-xs">자세히 보기</a>
								  </td>
								</tr>	
							</c:forEach>								      
						    </tbody>
						  </table>
						  
						  <!-- 결과가 없을 시 -->
						  <c:if test="${empty li }">
							<div >
							  <h4 style="text-align:center">검색 결과가 없습니다.</h4>
							  <p style="text-align:center">
							  	<a class="btn btn-primary" data-toggle="modal" data-target="#myModal">학생 정보 추가하기</a>
							  </p>
							</div>
						</c:if>
				 	</div>
				</div>
			</div>
		</div>
		<!-- 오른쪽 화면 -->
		<div class="col-xs-6">
			<c:if test="${!empty info.stuIdx}">
				<div class="one flex">
					<h4>학생 정보</h4>
					<table class="table">
					    <thead>
					      <tr>
					        <th>칼럼명</th>
					        <th>내용</th>
					      </tr>
					    </thead>
					    <tbody>
					      <tr>
					        <th>학생 번호</th>
					        <td>${info.stuIdx }</td>
					      </tr>
					      <tr>
					        <th>학생 이름</th>
					        <td>${info.stuName }</td>
					      </tr>
					      <tr>
					        <th>거주지(동)</th>
					        <td>${info.stuAddr }</td>
					      </tr>
					      <tr>
					        <th>학교</th>
					        <td>${info.stuSchool }</td>
					      </tr>
					      <tr>
					        <th>전공</th>
					        <td>${info.stuDept }</td>
					      </tr>
					    </tbody>
					  </table>
					  <div class="text-center">
					  <a class="btn btn-primary" data-toggle="modal" data-target="#myModal">수정</a>
					  <a class="btn btn-danger" id="deletebtn" href="${info.stuIdx }">삭제</a>
					  </div>
				  </c:if>
			</div>
		</div>
	</div>
	</div>
	<!-- 오른쪽 화면 끝 -->
	
	<!-- 모달 시작 -->
	<div class="container">
	  <!-- Modal -->
	  <div class="modal fade" id="myModal" role="dialog">
	    <div class="modal-dialog modal-sm">
	      <div class="modal-content">
	        <div class="modal-header">
	          <button type="button" class="close" data-dismiss="modal">&times;</button>
	          <h4 class="modal-title">
	          <c:if test="${empty info.stuIdx }">새로운 학생 정보 추가하기</c:if>
	          <c:if test="${!empty info.stuIdx }">학생 정보 수정하기</c:if>
	          </h4>
	        </div>
	        
	        <div class="modal-body">
			<c:if test="${empty info.stuIdx }">
			  <form id="frmadd" action="${root }/main/add" method="post">
			    <div class="form-group">
			      <label for="stuName">이름 :</label>
			      <input type="text" class="form-control" id="stuName" placeholder="학생 이름을 기입" name="stuName">
			    </div>
			    <div class="form-group">
			      <label for="stuAddr">주소(동) :</label>
			      <input type="text" class="form-control" id="stuAddr" placeholder="학생의 거주지 동만 기입" name="stuAddr">
			    </div>
				<div class="form-group">
			      <label for="stuSchool">학교명 :</label>
			      <input type="text" class="form-control" id="stuSchool" placeholder="학생의 거주지 동만 기입" name="stuSchool">
			    </div>
			    <div class="form-group">
			      <label for="stuDept">전공명 :</label>
			      <input type="text" class="form-control" id="stuDept" placeholder="학생의 거주지 동만 기입" name="stuDept">
			    </div>
			    <div class="modal-footer">
			        <button type="submit" class="btn btn-default">등록</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
	        	</div>
	      	  </form>
	      	  </c:if>
	      	  <c:if test="${!empty info.stuIdx }">
	      	  	<!-- 수정 -->
		      	  <form id="frmmodify" action="${root }/main/update" method="post">
		      	  	<input type="hidden" value=${info.stuIdx } name="stuIdx"/> 
				    <div class="form-group">
				      <label for="stuName">이름 :</label>
				      <input type="text" value="${info.stuName }" class="form-control" readonly="readonly">
				    </div>
				    <div class="form-group">
				      <label for="stuAddr">주소(동) :</label>
				      <input type="text" value="${info.stuAddr }" class="form-control" id="stuAddr" name="stuAddr">
				    </div>
					<div class="form-group">
				      <label for="stuSchool">학교명 :</label>
				      <input type="text" value="${info.stuSchool }" class="form-control" id="stuSchool" name="stuSchool">
				    </div>
				    <div class="form-group">
				      <label for="stuDept">전공명 :</label>
				      <input type="text" value="${info.stuDept }" class="form-control" id="stuDept" name="stuDept">
				    </div>
				    <div class="modal-footer">
				        <button type="submit" class="btn btn-default">등록</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
		        	</div>
		      	  </form>
	      	  	</c:if>
	      	 
      		</div>
			
		
      		
      		
      		
      		 <!-- 삭제 -->
      		<%-- <div class="container">
			  <!-- Modal -->
			  <div class="modal fade" id="deleteModal" role="dialog">
			    <div class="modal-dialog modal-sm">
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">새로운 학생 정보 추가하기</h4>
			        </div>
			        
			        <div class="modal-body">
		
					  <form action="${root }/main/delete" method="post">
					    ${info.stuName } 학생의 정보를 정말 삭제하시겠습니까?
					    
					    <input type="hidden" class="form-control" id="stuIdx" name="stuIdx" value="${info.stuIdx }">
		
					    <div class="modal-footer">
					        <button type="submit" class="btn btn-danger">삭제</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
			        	</div>
			      	  </form>
		      		 </div>
		      	   </div>
		      	 </div>
				</div>
				</div>  --%>
				
		      		
		      		
	      </div>
	    </div>
	  </div>
	</div>

</body>
</html>
