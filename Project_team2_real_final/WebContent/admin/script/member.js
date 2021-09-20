function loginCheck(){
	
	if(document.user.id.value.length == 0){ // 아무 값도 입력하지 않았을 경우 
		alert("아이디를 입력하세요."); // 경고창을 띄운다.
		document.user.id.focus(); // 다시 입력하라고 focus를 줌
		
		return false; //반환 타입은 false
	}
	if(document.user.password1.value == ""){
		alert("비밀번호는 반드시 입력해야 합니다.")
		document.user.password1.focus(); // 입력창에 커서 고정시켜라
		
		return false;
	}
	
	return true;
}

function idCheck_admin(){ //id 중복체크
	
	if(document.user.id.value == ""){
		alert("아이디를 입력하세요.");
		document.user.id.focus();
		
		return;
	}else if(document.user.id.value.length < 4){
		alert("아이디는 4글자 이상이어야 합니다.");
		document.user.id.focus();
		
		return false;
	}
	
	
	var popupX = (window.screen.width / 2) + (450 / 2);
	var popupY= (window.screen.height / 2) - 300;
	var url="../idCheck_admin.do?id="+document.user.id.value; //?다음에 값 //id를 get방식으로 넘겨주면서 idCheck_admin.do로 이동 //document.frm.userid.value -> 입력된 id
	window.open(url,"_blank_1","toolbar=no,menubar=no," +
			"scrollbars=yes,resizable=no,width=450,height=200,left="+popupX+", top="+popupY); //창을 만들어 연다
	/*제목 없을 때:_blank_1*/
}

function idok(id){ // id를 받아서 
	opener.user.id.value=document.user.id.value; //user -> form태그 이름 //오른쪽 부분을 왼쪽 부분에 대입
	opener.user.reid.value=document.user.id.value;
	self.close();
}

function updateCheck(){
	if(document.user.password1.value != document.user.password2.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.user.password2.focus();
		
		return false;
	}if(true){
		alert("회원정보가 수정되었습니다.");
	}
	return true;
}

function joinCheck_admin(){
	if(document.user.id.value.length == 0){ 
		alert("아이디를 입력하세요.");
		document.user.id.focus();
		
		return false;
	}
	if(document.user.id.value.length < 4){ 
		alert("아이디는 4글자 이상이어야 합니다.");
		document.user.id.focus();
		
		return false;
	}
	if(document.user.password1.value == ""){
		alert("비밀번호는 반드시 입력해야 합니다.");
		document.user.password1.focus();
		
		return false;
	}
	if(document.user.password1.value != document.user.password2.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.user.password2.focus();
		
		return false;
	}
	if(document.user.name.value.length == 0){
		alert("이름을 입력하세요.");
		document.user.name.focus();
		
		return false;
	}
	if(document.user.email.value.length == 0){ 
		alert("이메일을 입력하세요.");
		document.user.email.focus();
		
		return false;
	}
	if(document.user.phone.value.length == 0){ 
		alert("전화번호를 입력하세요.");
		document.user.phone.focus();
		
		return false;
	}
	if(document.user.reid.value.length == 0){
		alert("중복 체크를 하지 않았습니다.");
		document.user.id.focus();
		
		return false;
	}
	if(true){
		alert("회원가입이 완료되었습니다.");
	}
	return true;
}

function deleteCheck(){
	if(document.user.password1.value.length == ""){
		alert("비밀번호를 입력하세요");
		document.user.password1.focus();
		
		return false;
	}else if(document.user.password1.value != document.user.password.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.user.password1.focus();
		
		return false;
	}else{
		alert("회원탈퇴가 완료되었습니다.");
		
		return true;
	}
}