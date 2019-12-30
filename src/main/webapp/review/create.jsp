<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
 <style>
     #star_grade a{
        text-decoration: none;
        color: gray;
    }
    #star_grade a.on{
        color: red;
    }
</style>
<script type="text/JavaScript">
  window.onload=function(){
    CKEDITOR.replace('reviewcont');  // <TEXTAREA>태그 id 값
  };
  
  $('#star_grade a').click(function(){
      $(this).parent().children("a").removeClass("on");  /* 별점의 on 클래스 전부 제거 */ 
      $(this).addClass("on").prevAll("a").addClass("on"); /* 클릭한 별과, 그 앞 까지 별점에 on 클래스 추가 */
      return false;
  });
  
</script>


 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    리뷰 등록
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./list.do?reviewno=${param.reviewno }'>목록</A>
    <!-- <span class='menu_divide' >│</span> --> 
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' class="form-horizontal">
               
      <!-- FK memberno 지정 -->
      <!-- <input type='hidden' name='memberno' id='memberno' value='1'> -->
      <!-- FK categrpno 지정 -->
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control input-lg" name='reviewtitle' value='' placeholder="제목" required="required" style='width: 80%;'>
        </div>
      </div>   
      
      <div class="form-group">   
        <div class="col-md-12">
          <textarea class="form-control input-md" name='reviewcont' id='reviewcont' rows='5' placeholder="내용"></textarea>
        </div>
      </div>
      <div>
         <p id="star_grade">
            <a href="#" class="on">★</a>
            <a href="#" class="on">★</a>
            <a href="#" class="on">★</a>
            <a href="#" class="on">★</a>
            <a href="#" class="on">★</a>
         </p>
      </div>
      
      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-info">등록</button>
        <button type="button" 
                    onclick="location.href='./list.do?reviewno=${param.reviewno}'" 
                    class="btn btn-info">취소[목록]</button>
      </DIV>
       
    </FORM>
  </DIV>

  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
  