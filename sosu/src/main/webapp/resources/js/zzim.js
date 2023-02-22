var sess = $("#session").val();
function insertHeart(mo){

  if(sess != null) {
    
     $.ajax({
            url : "/moim/zzimInsert.do",
            type : "post",
            data : { M_IDX : sess, MO_IDX : mo},
            success : function(result){
            location.reload();}
        }); 
     }  
     if(sess == null) {
     
    alert("로그인이 필요한 서비스입니다.");
  }
}

function deleteHeart(mo){
  
  if(sess != null) {
    
     $.ajax({
            url : "/moim/zzimDelete.do",
            type : "post",
            data : { M_IDX : sess, MO_IDX : mo},
            success : function(result){
            location.reload();}
        }); 
     }
}