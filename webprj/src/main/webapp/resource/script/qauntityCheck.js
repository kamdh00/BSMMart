//============= 수량 체크 ===========================
/*
numCheck() : 한도수량 체크
up() : 수량 올림 체크
down() : 수량 내림 체크
*/

function numCheck(value, qu) {
	if (value > qu - 1) {
		alert("한정수량을 초과하였습니다.");
		document.form.quantity.value = qu;
	} else if (value < 2) {
		document.form.quantity.value = 1;
	}		
}

function up(value, qu) {
	if (value > qu - 1) {
		alert("한정수량을 초과하였습니다.");
		document.form.quantity.value = qu;
	} else {
		document.form.quantity.value = (value/1) + 1;
	}
	totalProductCal();
}

function down(value) {
	if (value < 2) {
		document.form.quantity.value = 1;
	} else {
		document.form.quantity.value = value - 1;
	}
	totalProductCal();
}