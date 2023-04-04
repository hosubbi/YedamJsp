<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="jquery/jquery-3.6.4.min.js"></script>
    <script>
      // document 로딩 후 처리.
      $(document).ready(function () {
        // fetch('url', {option})
        $.ajax({
            url: "memberListJquery.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
            data: { 
                name: "홍길동" // request.getParameter('name');
                ,id: 'user01' // request.getParameter('id');
            }, // HTTP 요청과 함께 서버로 보낼 데이터
            method: "GET", // HTTP 요청 방식(GET, POST)
            dataType: "json", // 서버에서 보내줄 데이터의 타입 : Json.pars()실행.
            success: function (result) { // 서버요청의 성공시 실행.
                //JSON.parse(result);
                console.log(result);
                $(result).each(function(idx, member) {
                    console.log(idx, member);
                    $('#list').append(
                        // tr>td*4 생성.
                        $('<tr id='+ member.memberId + ' />').append($('<td />').text(member.memberId),
                                           $('<td />').text(member.memberName),
                                           $('<td />').text(member.memberAddr),
                                           $('<td />').text(member.memberTel),
                                           $('<td />').text(member.memberPw),
                                           $('<td />').append($('<button />').text('삭제').on('click', rowDeleteFnc)),
                                           $('<td />').append($('<input />').attr('type', 'checkbox'))
                                           //$('<td />').append($('<input type="checkbox" />')
                                           )
                    );
                });
            },
            error: function (err) { // 서버요청의 실패시 실행.
                console.error(err);
            }
        
        })  // $.ajax()
        
		        
        
        
        // 추가버튼 이벤트 & 이벤트 핸들러
        $('#addBtn').on('click', function(e) {
            e.preventDefault(); // 전송기능 차단.
			// 사용자가 필수입력값을 입력했는지 validation 하고
			
			let idVal = $('#id').val();
            let nameVal = $('#name').val();
            let passVal = $('#passwd').val();
            
            if(idVal == null || nameVal == null || passVal == null){
            	alert('필수항목을 입력하세요');
            }
	        // ajax호출.
	        $.ajax({
			    url: "dataTableAdd.do", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
			    data: { id: $('#id').val(), name: $('#name').val(), addr: $('#addr').val(), tel: $('#tel').val(), passwd: $('#passwd').val() }, // HTTP 요청과 함께 서버로 보낼 데이터
			    //console.log($('#id').val() + $('#name').val() + $('#addr').val() + $('#tel').val() + $('#passwd').val());
			   
			    method: "post", // HTTP 요청 방식(GET, POST)
			    dataType: "json", // 서버에서 보내줄 데이터의 타입
			    success: function(result){
			    	if (result.retCode == 'Success') {
			    		// 성공
			            $('#list').append(
			                        // tr>td*4 생성.
			                        $('<tr />').append($('<td />').text($('#id').val()),
			                                           $('<td />').text($('#name').val()),
			                                           $('<td />').text($('#passwd').val()),
			                                           $('<td />').text($('#addr').val()),
			                                           $('<td />').text($('#tel').val()),
			                                           $('<td />').append($('<button />').text('삭제').on('click', rowDeleteFnc))
			                                           )
			             );
			    	} else if (result.retCode == 'Fail') {
			    		// 처리중 에러
			    	} else {
			    		// 반환 코드 확인
			    		
			    	}
			    },
			    error: function (reject) {
			    	
			    }
			})
            
        })
        
                
        // 체크박스 전체 선택
        $('th>input[type="checkbox"]').on('change', function(e) {
            //$('td>input').attr('checked', 'checked');
            $('td>input').prop({checked: this.checked});
        })

        // 체크박스 하나로 인해 전체 선택 풀리고 전체선택 체크 되게 하기
        // ajax호출의 결과로 만들어지는 부분
		$('#list').on('change','td>input[type="checkbox"]', function(){
			console.log(this);
			let checkCnt = $('td>input[type="checkbox"]:checked').length;
			let allCnt = $('td>input[type="checkbox"]').length;
			if(checkCnt == allCnt) {
				$('th>input[type="checkbox"]').prop({checked: true});
			} else {
				$('th>input[type="checkbox"]').prop({checked: false});
			}
        })
        
        // 삭제버튼 이벤트 핸들러
        function rowDeleteFnc() {
            $(this).parentsUntil('tbody').remove(); // parentsUntil = tbody를 만나기 까지 요소
        }

        // 체크박스 선택 되어있는것 삭제
        $('#delSelected').on('click', function(e) {
            e.preventDefault();
            let memberIdAray = ''; // memberId=user01&memberID=user02&memberId=user03
            //$('#list input:checked').closest('tr').remove();
			
            $('#list input:checked').each(function (idx, item) {
            	console.log($(item).parent().parent().attr('id'));
            	memberIdAray += '&memberId=' + $(item).parent().parent().attr('id');
                $(item).closest('tr').remove(); // closest 가장 먼저나오는 tr제거
            })
            console.log(memberIdAray);
            
            // ajax호출
            $.ajax({
            	url: 'memberRemoveJquery.do', // 호출할 컨트롤
            	method: 'post',
            	data: memberIdAray.substring(1), // memberId=user01&memberId=user02
            	success: function (result) {
            		if (result.retCode == 'Success')
            			$('#list input:checked').closest('tr').remove();
            		else
            			alert('error !!');
            	},
            	error: function (reject) {
            		console.log(reject)
            	}
            })
            
        })


      });  

      


    </script>
</head>
<body>
    <div>
        <form>
          <table class="table" border="1">
            <tr>
              <td>Id:</td>
              <td><input type="text" id="id"></td>
            </tr>
            <tr>
              <td>Name:</td>
              <td><input type="text" id="name"></td>
            </tr>
            <tr>
              <td>Pass:</td>
              <td><input type="text" id="passwd"></td>
            </tr>
            <tr>
              <td>Addr:</td>
              <td><input type="text" id="addr"></td>
            </tr>
            <tr>
              <td>Tel:</td>
              <td><input type="text" id="tel"></td>
            </tr>
            <tr>
              <td colspan='2' align="center">
                <button id="addBtn">등록</button>
                <button id="delSelected">선택삭제</button>
              </td>
            </tr>
          </table>
        </form>
      </div>
      <!-- 목록 -->
      <div>
        <table class="table" border="1">
          <thead>
            <tr>
              <th>Id</th>
              <th>Name</th>
              <th>Pass</th>
              <th>주소</th>
              <th>연락처</th>
              <th>삭제</th>
              <th><input type="checkbox"></th>
            </tr>
          </thead>
          <tbody id="list">
          </tbody>
        </table>
      </div>
</body>
</html>