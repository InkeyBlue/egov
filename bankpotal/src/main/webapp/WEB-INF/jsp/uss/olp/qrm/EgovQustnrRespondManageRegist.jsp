<%--
  Class Name : EgovQustnrRespondManageRegist.jsp
  Description : 응답자정보 등록 페이지
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09
   
--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>
<c:set var="ImgUrl" value="/images/egovframework/com/uss/olp/qrm/"/>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
<meta http-equiv="content-language" content="ko">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<link rel="icon" href="<c:url value='/'/>img/mdb-favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
<link rel="stylesheet" href="<c:url value='/'/>css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value='/'/>css/mdb.min.css">
<link rel="stylesheet" href="<c:url value='/'/>css/style.css"> 

<title>응답자정보 등록</title>

<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="qustnrRespondManageVO" staticJavascript="false" xhtml="true" cdata="false"/>
<script type="text/javascript" src="<c:url value='/js/showModalDialog.js'/>" ></script>
<script type="text/javaScript" language="javascript">
/* ********************************************************
 * 초기화
 ******************************************************** */
function fn_egov_init_QustnrRespondManage(){

}
/* ********************************************************
 * 목록 으로 가기
 ******************************************************** */
function fn_egov_list_QustnrRespondManage(){
	location.href = "<c:url value='/uss/olp/qrm/EgovQustnrRespondManageList.do'/>";
}
/* ********************************************************
 * 저장처리화면
 ******************************************************** */
function fn_egov_save_QustnrRespondManage(){
	var varFrom = document.qustnrRespondManageVO;

	if(confirm("<spring:message code='common.save.msg' />")){
		varFrom.action =  "<c:url value='/uss/olp/qrm/EgovQustnrRespondManageRegist.do'/>";
		varFrom.brth.value = fn_egov_SelectBoxValue('brthYYYY') + "" + fn_egov_SelectBoxValue('brthMM') + "" + fn_egov_SelectBoxValue('brthDD');
		
		if(varFrom.qestnrCn.value == "" ||
				varFrom.qestnrTmplatId.value == "" ||
				varFrom.qestnrId.value == ""  
				){
			alert("설문지정보를  입력해주세요!");
			varFrom.qestnrCn.focus();
			return;
		}
		
		if(!validateQustnrRespondManageVO(varFrom)){ 			
			return;
		}else{
			varFrom.submit();
		} 
	}
}

/* ********************************************************
 * 설문지정보 팝업창열기
 ******************************************************** */
 function fn_egov_QustnrManageListPopup_QustnrItemManage(){

 	window.showModalDialog("<c:url value='/uss/olp/qmc/EgovQustnrManageListPopup.do'/>", self,"dialogWidth=800px;dialogHeight=500px;resizable=yes;center=yes");
 	
 }
/************************************************************************
//셀렉트박스 값 컨트롤 함수
************************************************************************/

	function fn_egov_SelectBoxValue(sbName) {
		var FValue = "";
		for (var i = 0; i < document.getElementById(sbName).length; i++) {
			if (document.getElementById(sbName).options[i].selected == true) {

				FValue = document.getElementById(sbName).options[i].value;
			}
		}

		return FValue;
	}
</script>
</head>
<body onLoad="fn_egov_init_QustnrRespondManage()">
<div class="container-for-admin">
  <!--Main Navigation-->
  <header>
    <div id="header"><c:import url="/sym/mms/EgovMainMenuHead.do?flag=MAIN" /></div>
  </header>
  <!--Main Navigation-->

  <!--Main layout-->
  <main class="mt-5 pt-5">
     <div class="container">

      <!--Section: Jumbotron-->
      <section class="card wow fadeIn" style="background-image: url(<c:url value='/'/>images/gradient1.jpg);">

        <!-- Content -->
        <div class="card-body text-white text-center py-5 px-5 my-5">
          <h1 class="mb-4"><strong>서비스 관리</strong></h1>
          <p>
            <strong>설문 응답자를 관리합니다</strong>
          </p>
        </div>
        <!--// Content -->
      </section>
      <!--//Section: Jumbotron-->
     
      <!--Section: Cards-->
      <section class="text-center">
        <!--Grid row-->
        <div class="row mb-4 wow fadeIn">
        

            <div id="content_field"><!--contents start-->

            
            <form:form commandName="qustnrRespondManageVO" name="qustnrRespondManageVO" action="" method="post">

            <!-- sub title start -->
            <div><h2>응답자정보 등록</h2></div>
            <!-- sub title end -->

            <!--detail area start -->
            <div class="search_service">
                <div class="search_top_table">
					<table summary="이 표는 응답자정보를 제공하며, 설문관리정보, 성별, 직업, 생년월일, 응답자명, 전화번호 정보로 구성되어 있습니다 .">
					  <tr> 
					    <td class="td_width">설문지정보<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/></td>
					    <td class="td_content">
					    <input name="qestnrCn" id="qestnrCn" type="text" title="설문지정보 입력" size="73" value="" maxlength="4000" style="width:300px;">
					    <a href="#LINK" onClick="fn_egov_QustnrManageListPopup_QustnrItemManage()">     
					    <img src="<c:url value='/images/img_search.gif'/>" onClick=""align="middle" style="border:0px" alt="설문지정보" title="설문지정보">
					    </a>
					    <input name="qestnrId" id="qestnrId" type="hidden" value="">
					    <input name="qestnrTmplatId" id="qestnrTmplatId" type="hidden" value="">  
					    </td>
					  </tr>
					  <tr> 
					    <td class="td_width">성별<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/></td>
					    <td class="td_content">
							<form:select path="sexdstnCode" title="성별 선택">
							    <option value="">선택</option>
							    <form:options items="${comCode014}" itemValue="code" itemLabel="codeNm"/>
							</form:select>
							<form:errors path="sexdstnCode"/>
					    </td>
					  </tr>
					  <tr> 
					    <td class="td_width">직업<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/></td>
					    <td class="td_content">
							<form:select path="occpTyCode" title="직업 선택">
							    <option value="">선택</option>
							    <form:options items="${comCode034}" itemValue="code" itemLabel="codeNm"/>
							</form:select>
							<form:errors path="occpTyCode"/>
					    </td>
					  </tr>
					  <tr> 
					    <td class="td_width">생년월일<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/></td>
					    <td class="td_content">
					       <select name="brthYYYY" id="brthYYYY" title="생년 선택">
					         <c:forEach var="h" begin="1960" end="2009" step="1">
					            <option value="${h}">${h}</option>
					          </c:forEach>
					       </select>년
					       <select name="brthMM" id="brthMM" title="월 선택">
					         <c:forEach var="h" begin="1" end="12" step="1">
					            <option value="<c:if test="${h < 10}">0</c:if>${h}"><c:if test="${h < 10}">0</c:if>${h}</option>
					          </c:forEach>
					       </select>월
					       <select name="brthDD" id="brthDD" title="일 선택">
					         <c:forEach var="h" begin="1" end="31" step="1">
					            <option value="<c:if test="${h < 10}">0</c:if>${h}"><c:if test="${h < 10}">0</c:if>${h}</option>
					          </c:forEach>
					       </select>일
					       <input name="brth" id="brth" type="hidden" value="">
					    </td>
					  </tr> 
					  
					  <tr> 
					    <td class="td_width">응답자명<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/></td>
					    <td class="td_content">
					        <input name="respondNm" type="text" title="응답자명 입력" size="73" value="" maxlength="50" style="width:120px;">
					        <form:errors path="respondNm" cssClass="error" />
					    </td>
					  </tr>
					  
					  <tr> 
					    <td class="td_width">전화번호<img src="<c:url value='/'/>images/required.gif" alt="필수항목" title="필수항목" width="15" height="15"/></td>
					    <td class="td_content">
					      <input name="areaNo" type="text" title="지역번호 입력" size="4" value="" maxlength="4">-
					      <input name="middleTelno" type="text" title="국번 입력" size="4" value="" maxlength="4">-
					      <input name="endTelno" type="text" title="전화번호 입력" size="4" value="" maxlength="4">
					      <form:errors path="areaNo" cssClass="error" />
					      <form:errors path="middleTelno" cssClass="error" />
					      <form:errors path="endTelno" cssClass="error" />
					    </td>
					  </tr>
					</table>
                    
                </div>
            </div>
            <!--detail area end -->
                
            <!-- 목록/저장버튼  시작-->
            <table border="0" cellspacing="0" cellpadding="0" align="center"><tr><td>
            <div class="buttons" align="center" style="margin-bottom:100px">
			  <a href="<c:url value='/uss/olp/qrm/EgovQustnrRespondManageList.do'/>">목록</a>
			  <input type="submit" value="저장" onclick="fn_egov_save_QustnrRespondManage(document.forms[0]); return false;" />       
			</div>
            </td></tr></table>
            <!-- 목록/저장버튼  끝-->

			<input name="cmd" type="hidden" value="<c:out value='save'/>">
			</form:form>

            </div><!-- contents end -->
        </div>
        <!--//Grid row-->
      </section>
      <!--//Section: Cards-->
    </div> <!--//container -->
  </main>
  <!--Main layout-->

  <!-- footer 시작 -->
  <div id="footer"><c:import url="/EgovPageLink.do?link=main/inc/EgovIncFooter" /></div>
  <!-- //footer 끝 -->
</body>
</html>