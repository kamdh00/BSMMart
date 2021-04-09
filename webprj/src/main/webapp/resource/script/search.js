// 엔터 체크	
function pressCheck() {   
	if (event.keyCode == 13) {
		return doSearch();
	}else{
		return false;
	}
}

// 검색
function doSearch() {
	var searchForm = document.search; 
	if (searchForm.query.value == "") {
		alert("검색어를 입력하세요.");
		searchForm.query.focus();
		return;
	}
	
	searchForm.submit();
}
