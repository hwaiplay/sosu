function check() {
	
	let category = $("#category").text();
	let idx = $("#RV_IDX").text();
	
    if (confirm("게시글을 삭제 하시겠습니까?"))
    {
        alert("삭제 되었습니다.");

        location.href="/review/reviewDelete.sosu";

    } else 
    {
        location.href="/review/" + category + "/" + idx + ".sosu";

		return false;
	}
}