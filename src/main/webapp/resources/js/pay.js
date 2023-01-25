let flag = false; // 플래그
let IMP = window.IMP; // 생략가능
// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
IMP.init('imp26378240'); 

/* 결제방식 */
function payModule(){
    let method_num = $("input[name='r_payMethod']").val();
    // 결제 방식 0: 무통장, 1: 일반카드결제, 2: 카카오페이
    if(method_num == 2)
    {
        kakaopay();
    } else if(method_num == 1)
    {
        cardPay();
    } else if(method_num == 0)
	{
        mooTongjang();
	}
    return flag;
};

/* 카카오페이 */
function kakaopay()
{
    IMP.request_pay({
        pg : 'kakaopay',
        pay_method : 'kakaopay',
        merchant_uid: "HDORD" + $("#r_c_idx").val() + $("#c_idx").val() + "-" + new Date().getTime(), //상점거래ID
        name: $("#r_room_name").val(),
        amount: $("#r_price").val(),
        buyer_email: $("#m_email").val(),
        buyer_name: $("#r_name").val(),
        buyer_tel: $("#r_cellphone").val()
    }, function(rsp) {
        if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            orderSuccess(rsp);
            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
            var msg = '결제가 완료되었습니다.';
            msg += '\n고유ID : ' + rsp.imp_uid;
            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
            msg += '\n결제 금액 : ' + rsp.paid_amount + "원";
            alert(msg);

            // 결제 성공시 주문번호 값 출력 및 전송
            $("#uid").html("<input type='hidden' name='r_uid' value='"+ rsp.merchant_uid +"'>");

            $("#payForm").attr("onsubmit", "return true");
            $("#payForm").submit();
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '\n에러내용 : ' + rsp.error_msg;
            
            alert(msg);
        }
    });
    return flag;
}

/* 일반카드결제 */  	  	
function cardPay() {
	IMP.request_pay({ // param
		pg : "html5_inicis",
		pay_method: "card",
		merchant_uid: "HDORD" + $("#r_c_idx").val() + $("#c_idx").val() + "-" + new Date().getTime(), //상점거래ID
		name: $("#r_room_name").val(),
		amount: $("#r_price").val(),
		buyer_email: $("#m_email").val(),
		buyer_name: $("#r_name").val(),
		buyer_tel: $("#r_cellphone").val(),
	}, function (rsp) {
		if ( rsp.success ) {
            //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
            orderSuccess(rsp);
            //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
            
            var msg = '결제가 완료되었습니다.';
            msg += '\n고유ID : ' + rsp.imp_uid;
            msg += '\n상점 거래ID : ' + rsp.merchant_uid;
            msg += '\n결제 금액 : ' + rsp.paid_amount + "원";
            alert(msg);

            // 결제 성공시 주문번호 값 출력 및 전송
            $("#uid").html("<input type='hidden' name='r_uid' value='"+ rsp.merchant_uid +"'>");

            $("#payForm").attr("onsubmit", "return true");
            $("#payForm").submit();
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            
            alert(msg);
        }
    });
    return flag;
};

/* 무통장 */
function mooTongjang()
{
    let uid = "HDORD" + $("#r_c_idx").val() + $("#c_idx").val() + "-" + new Date().getTime(); 

    $("#uid").html("<input type='hidden' name='r_uid' value='"+ uid +"'>");

    flag = true;
}

function orderSuccess(rsp)
{
    jQuery.ajax({
        url: "/user/reserv/pay", 
        type: 'POST',
        dataType: 'json',
        data: {
            imp_uid : rsp.imp_uid
            //기타 필요한 데이터가 있으면 추가 전달
        }
    });
}
