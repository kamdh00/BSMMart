//============= �����̹��� ===========================
/*
swapImage() : �̹����� ���ϴ� �̹����� ������ ��쿡 ���˴ϴ�.
restoreImage() : swapImage()�Լ��� ���� ����� �̹����� �ٽ� �����մϴ�.
*/

function swapImage() {
	var arr=new Array();
	document.oImg=new Array();
	arr=swapImage.arguments;
	var arrCnt=arr.length;
	for(var i=0;i<arrCnt;i+=2) {
		var tImg=document.getElementById(arr[i]);
		document.oImg[i]=arr[i];
		document.oImg[i+1]=tImg.src;
		tImg.setAttribute("src",arr[i+1]);
	}
}

function restoreImage() {
	if(document.oImg) {
		var oImgCnt=document.oImg.length;
		for(var i=0;i<oImgCnt;i+=2) {
			var tImg=document.getElementById(document.oImg[i]);
			tImg.setAttribute("src",document.oImg[i+1]);
		}
	}
}