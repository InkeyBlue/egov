<%--
  Class Name : EgovNoticeRegist.jsp
  Description : 게시물  생성 화면
  Modification Information
 
      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2009.03.24  이삼섭          최초 생성
     2011.08.31  JJY       경량환경 버전 생성
 
    author   : 공통서비스 개발팀 이삼섭
    since    : 2009.03.24
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="validator" uri="http://www.springmodules.org/tags/commons-validator" %>

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
<!-- 
<link href="<c:url value='${brdMstrVO.tmplatCours}' />" rel="stylesheet" type="text/css">
-->
<script type="text/javascript" src="<c:url value='/js/EgovBBSMng.js' />"></script>
<!-- script type="text/javascript" src="<c:url value='/html/egovframework/cmm/utl/htmlarea/EgovWebEditor.js'/>" ></script-->
<script type="text/javascript" src="<c:url value='/js/EgovMultiFile.js'/>" ></script>
<script type="text/javascript" src="<c:url value='/js/EgovCalPopup.js'/>" ></script>
<script type="text/javascript" src="<c:url value="/validator.do"/>"></script>
<validator:javascript formName="board" staticJavascript="false" xhtml="true" cdata="false"/>

<c:if test="${anonymous == 'true'}"><c:set var="prefix" value="/anonymous"/></c:if>
<script type="text/javascript">
    function fn_egov_validateForm(obj) {
        return true;
    }
    
    function fn_egov_regist_notice() {
        //document.board.onsubmit();
        
        if (!validateBoard(document.board)){
            return;
        }
        if (confirm('<spring:message code="common.regist.msg" />')) {
            //document.board.onsubmit();
            document.board.action = "<c:url value='/cop/bbs${prefix}/insertBoardArticle.do'/>";
            document.board.submit();                    
        }
    }
    
    function fn_egov_select_noticeList() {
        document.board.action = "<c:url value='/cop/bbs${prefix}/selectBoardList.do'/>"+ "?bbsId=" +"<c:out value='${bdMstr.bbsId}'/>";
        document.board.submit();
    }  
</script>
<title><c:out value='${bdMstr.bbsNm}'/> - 게시글쓰기</title>

</head>
<!-- body onload="javascript:editor_generate('nttCn');"-->
<body onLoad="document.board.nttSj.focus();">
<noscript><p>자바스크립트를 지원하지 않는 브라우저에서는 일부 기능을 사용하실 수 없습니다.</p></noscript>
  <!--Main Navigation-->
  <header>
    <div id="header"><c:import url="/sym/mms/EgovMainMenuHead.do?flag=MAIN" /></div>
  </header>
  <!--Main Navigation-->

  <!--Main layout-->
  <main class="mt-5 pt-5">
     <div class="container">

      <!--Section: Jumbotron-->
      <!-- <section class="card wow fadeIn" style="background-image: url(<c:url value='/'/>images/gradient1.jpg);"> -->
      <section class="card wow fadeIn">
        <!-- Content -->
        <div class="card-body text-dark text-center py-3 px-5 my-1">
          <h1 class="pt-2"><strong><c:out value='${bdMstr.bbsNm}'/></strong></h1> <!-- 글쓰기 -->
        </div>
        <!--// Content -->
      </section>
      <!--//Section: Jumbotron-->
     
      <!--Section: Cards-->
      <section class="text-center">
        <!--Grid row-->
        <div class="row mb-4 wow fadeIn">

            <div class="col-lg-12 col-md-12 mb-12"><!--contents start-->
            
            <form:form commandName="board" name="board" method="post" enctype="multipart/form-data" >
            
            <input name="pageIndex" type="hidden" value="<c:out value='${searchVO.pageIndex}'/>"/>
            <input type="hidden" name="bbsId" value="<c:out value='${bdMstr.bbsId}'/>" />
            <input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
            <input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
            <input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
            <input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
            <input type="hidden" name="posblAtchFileNumber" value="<c:out value='${bdMstr.posblAtchFileNumber}'/>" />
            <input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
            <input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />
            
            <input type="hidden" name="cal_url" value="<c:url value='/sym/cmm/EgovNormalCalPopup.do'/>" />
            <input type="hidden" name="authFlag" value="<c:out value='${bdMstr.authFlag}'/>" />

            <c:if test="${anonymous != 'true'}">
            <input type="hidden" name="ntcrNm" value="dummy">   <!-- validator 처리를 위해 지정 -->
            <input type="hidden" name="password" value="dummy"> <!-- validator 처리를 위해 지정 -->
            </c:if>

            <c:if test="${bdMstr.bbsAttrbCode != 'BBSA01'}">
               <input name="ntceBgnde" type="hidden" value="10000101">
               <input name="ntceEndde" type="hidden" value="99991231">
            </c:if>
            
            <!-- sub title start -->
            <!-- <div><h2><c:out value='${bdMstr.bbsNm}'/> - 게시글쓰기</h2></div> -->
            <!-- sub title end -->
            
            <!--detail area start -->
            <div class="search_service">
                <div class="search_top_table">
				    <table class="table">
                            <tr>
                                <td class="td_width text-right" ><label for="nttSj"><spring:message code="cop.nttSj" /></label>
                                <img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
                                </td>
                                <td  class="td_content text-left" colspan="3">
                                  <input id="nttSj" name="nttSj" type="text" size="60" value=""  maxlength="60" > 
                                  <br/><form:errors path="nttSj" />
                                </td>
                            </tr>
                            <tr> 
                                <td class="td_width text-right" ><label for="nttCn"><spring:message code="cop.nttCn" /></label>
                                <img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
                                </td>
                                <td  class="td_content text-left" colspan="3">
                                  <textarea id="nttCn" name="nttCn" class="textarea" cols="95" rows="28" ></textarea> 
                                  <form:errors path="nttCn" />
                                </td>
                            </tr>
                            <c:choose>
                                <c:when test="${bdMstr.bbsAttrbCode == 'BBSA01'}">
                                  <tr> 
                                    <td class="td_width text-right" ><spring:message code="cop.noticeTerm" />
                                    <img src="<c:url value='/images/required.gif' />" width="15" height="15" alt="required" />
                                    </td>
                                    <td  class="td_content text-left" colspan="3">
                                      <input name="ntceBgnde" type="hidden" >
                                      <input name="ntceBgndeView" title="게시시작일" type="text" size="10" value=""  readonly="readonly"
                                        onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView,'','<c:url value='/sym/cmm/EgovselectNormalCalendar.do'/>');" >
                                      <img src="<c:url value='/images/calendar.gif' />"
                                        onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceBgnde, document.board.ntceBgndeView,'','<c:url value='/sym/cmm/EgovselectNormalCalendar.do'/>');"
                                        width="15" height="15" alt="calendar">
                                      ~
                                      <input name="ntceEndde" type="hidden"  />
                                      <input name="ntceEnddeView" title="게시종료일" type="text" size="10" value=""  readonly="readonly"
                                        onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceEndde, document.board.ntceEnddeView,'','<c:url value='/sym/cmm/EgovselectNormalCalendar.do'/>');"  >
                                      <img src="<c:url value='/images/calendar.gif' />"
                                        onClick="javascript:fn_egov_NormalCalendar(document.board, document.board.ntceEndde, document.board.ntceEnddeView,'','<c:url value='/sym/cmm/EgovselectNormalCalendar.do'/>');"
                                        width="15" height="15" alt="calendar">
                                        <br/><form:errors path="ntceBgnde" />
                                        <br/><form:errors path="ntceEndde" />
                                        
                                    </td>
                                  </tr>     
                                  </c:when>
                                <c:otherwise>
                                
                                </c:otherwise>
                            </c:choose>
                        
                            <c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">          
                              <tr>
                                <td class="td_width text-right" ><label for="egovComFileUploader"><spring:message code="cop.atchFile" /></label></td>
                                <td class="td_content text-left" colspan="3">
                                            <input name="file_1" id="egovComFileUploader" type="file" />
                                                <div id="egovComFileList"></div>
                                </td>
                              </tr>
                            </c:if>
                        </table>
                        <c:if test="${bdMstr.fileAtchPosblAt == 'Y'}">
                        <script type="text/javascript">
                            var maxFileNum = document.board.posblAtchFileNumber.value;
                            if(maxFileNum==null || maxFileNum==""){
                                maxFileNum = 3;
                            } 
                            var multi_selector = new MultiSelector( document.getElementById( 'egovComFileList' ), maxFileNum );
                            multi_selector.addElement( document.getElementById( 'egovComFileUploader' ) );         
                        </script>
                        </c:if>
                </div>
            </div>
            <!--detail area end -->
            
<!-- 목록/저장버튼  시작-->
            <table border="0" cellspacing="0" cellpadding="0" align="center"><tr><td>
            <div class="buttons" align="center" style="margin-bottom:100px">
		          <c:if test="${bdMstr.authFlag == 'Y'}">
		          <a class="btn btn-primary btn-lg active" role="button" aria-pressed="true" href="#LINK" onclick="javascript:fn_egov_regist_notice(); return fasle;"><spring:message code="button.save" /></a> 
		          </c:if>
		          <a class="btn btn-primary btn-lg active" role="button" aria-pressed="true" href="#LINK" onclick="javascript:fn_egov_select_noticeList(); return fasle;"><spring:message code="button.list" /></a> 
            </div>
            </td></tr></table>
            <!-- 목록/저장버튼  끝-->

            </form:form>

            </div><!-- contents end -->
            
           </div>
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
