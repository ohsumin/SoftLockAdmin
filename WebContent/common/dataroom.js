// 자료실 리스트에서 검색어 입력 확인부분
function searchValidate(frm){
	if(frm.searchWord.value==""){
		alert("검색어를 먼저 입력해주세요.");
		frm.searchWord.focus();
		return false;
	}
}

// 자료실 글쓰기폼 공백체크
function frmValidate(frm) {
	if(frm.name.value==""){
		alert("이름을 입력해주세요.");
		frm.name.focus();
		return false;
	}
	if(frm.pass.value==""){
		alert("비밀번호를 입력해주세요.");
		frm.pass.focus();
		return false;
	}
	if(frm.title.value==""){
		alert("제목을 입력해주세요.");
		frm.title.focus();
		return false;
	}
	if(frm.content.value==""){
		alert("내용을 입력해주세요.");
		frm.content.focus();
		return false;
	}
}

function commValidate(frm) {
	if(frm.co_id.value==""){
		alert("작성자를 입력해주세요.");
		frm.co_id.focus();
		return false;
	}
	if(frm.co_pw.value==""){
		alert("비밀번호를 입력해주세요.");
		frm.co_pw.focus();
		return false;
	}
	if(frm.co_content.value==""){
		alert("내용을 입력해주세요.");
		frm.co_content.focus();
		return false;
	}
}