<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="//cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
<script src="jquery/jquery-3.6.4.min.js"></script>
<script src="//cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script>

$(document).ready(function () {
    var t = $('#example').DataTable({
        ajax: 'dataTableAjax.do',
    });
    
    
    $('#addRow').on('click', function () {
        //t.row.add([, $('#first').val(), $('#last').val(), $('#email').val(), $('#hireDate').val(), $('#salary').val()]).draw(false);
        // ajax호출.
        $.ajax({
		    url: "dataTableAdd.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
		    data: { first: $('#first').val(), last: $('#last').val(), email: $('#email').val(), hireDate: $('#hireDate').val(), salary: $('#salary').val() }, // HTTP 요청과 함께 서버로 보낼 데이터
		    //console.log($('#id').val() + $('#name').val() + $('#addr').val() + $('#tel').val() + $('#passwd').val());
		   
		    method: "post", // HTTP 요청 방식(GET, POST)
		    dataType: "json", // 서버에서 보내줄 데이터의 타입
		    success: function(result){
		    	if (result.retCode == 'Success') {
		    		// 성공
		    		t.row.add([result.emp, $('#first').val(), $('#last').val(), $('#email').val(), $('#hireDate').val(), $('#salary').val()]).draw(false);
		    	} else if (result.retCode == 'Fail') {
		    		// 처리중 에러
		    	} else {
		    		// 반환 코드 확인
		    		
		    	}
		    },
		    error: function (reject) {
		    	
		    }
		})
    });
    
    $('#example tbody').on('click', 'tr', function () {
        if ($(this).hasClass('selected')) {
            $(this).removeClass('selected');
        } else {
            table.$('tr.selected').removeClass('selected');
            $(this).addClass('selected');
        }
    });
 
    $('#button').click(function () {
        table.row('.selected').remove().draw(false);
    });
 
});
</script>
</head>
<body>
	<p>dataTable</p>
	<input type="text" id="first" required="required"><br>
	<input type="text" id="last" required="required"><br>
	<input type="email" id="email" required="required"><br>
	<input type="date" id="hireDate" required="required"><br>
	<input type="number" id="salary" required="required"><br>
	<button id="addRow">등록</button><br>
	<button id="button">삭제</button><br>
	<br>
	<table id="example" class="display" style="width:100%">
	        <thead>
	            <tr>
	                <th>사원번호</th>
	                <th>firstName</th>
	                <th>lastName</th>
	                <th>email</th>
	                <th>hireDate</th>
	                <th>Salary</th>
	            </tr>
	        </thead>
	        <tfoot>
	            <tr>
	                <th>사원번호</th>
	                <th>firstName</th>
	                <th>lastName</th>
	                <th>email</th>
	                <th>hireDate</th>
	                <th>Salary</th>
	            </tr>
	        </tfoot>
	</table> 
</body>
</html>