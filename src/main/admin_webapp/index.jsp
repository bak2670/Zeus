<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<html>
<body>
<h2>Hello World!</h2>

<html>
<head>
<script language="javascript" type="text/javascript">
 function checkAll(checkList, boolCheck) {
  varchkSize = 0;
  checkedCount = checkList.length;

  if (typeof (checkedCount) != "undefined") {
   for ( var i = 0; i < chkSize; i++) {
    checkList[i].checked = boolCheck;
   }
  }
 }

 function checkDel() {
  var chkFirList = document.getElementsByName('check');
  var arrFir = new Array();
  var cnt = 0;
  for ( var idx = chkFirList.length - 1; 0 <= idx; idx--) {
   if (chkFirList[idx].checked) {
    arrFir[cnt] = chkFirList[idx].value;
    cnt++;
   }
  }
  if (arrFir.length != 0) {
   document.form1.submit();
  } else {
   alert('삭제할 **를 선택하세요.');
   return;
  }
 }
</script>
</head>
<body>
 <form name="form1" method="post" action="formprocess.jsp" id="checkList">
  <input type="checkbox" onclick="javascript:checkAll(document.getElementsByName('check'), this.checked);" />전체선택
  <input type="checkbox" name="check" value="1" /> 1
   <input type="checkbox" name="check" value="2" /> 2
   <input type="checkbox" name="check" value="3" /> 3
   <input type="checkbox" name="check" value="4" /> 4
   <input type="checkbox" name="check" value="5" /> 5
   <input type="button" value="삭제" onclick="checkDel();">
 </form>
</body>
</html>

출처: https://bboks.net/247 [bboks.net™ :: Life is SELF - Be the primary actor in your LIFE]
</body>
</html>
