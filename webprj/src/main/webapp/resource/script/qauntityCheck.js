//============= ���� üũ ===========================
/*
numCheck() : �ѵ����� üũ
up() : ���� �ø� üũ
down() : ���� ���� üũ
*/

function numCheck(value, qu) {
	if (value > qu - 1) {
		alert("���������� �ʰ��Ͽ����ϴ�.");
		document.form.quantity.value = qu;
	} else if (value < 2) {
		document.form.quantity.value = 1;
	}		
}

function up(value, qu) {
	if (value > qu - 1) {
		alert("���������� �ʰ��Ͽ����ϴ�.");
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