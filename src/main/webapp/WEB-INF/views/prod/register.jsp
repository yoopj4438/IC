<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<style>
  #modal,
  #modal1 {
    display: none;
    position: absolute;
    width: 100%;
    height: 100%;
    top: 0;
    left: 0;
    z-index: 1;
  }

  #modal h2 {
    margin: 0;
  }

  #modal1 h2 {
    margin: 0;
  }

  #modal button {
    display: inline-block;
    width: 100px;
    margin-left: calc(100% - 100px - 10px);
  }

  #modal1 button {
    display: inline-block;
    width: 100px;
    margin-left: calc(100% - 100px - 10px);
  }

  #modal .modal_content,
  #modal1 .modal_content1 {
    width: 300px;
    margin: 100px auto;
    padding: 20px 10px;
    background: #fff;
    border: 2px solid #666;
  }

  #modal .modal_layer,
  #modal1 .modal_layer1 {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    z-index: -1;
  }
</style>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

<script>

  $(document).ready(function () {
    $("#modal_opne_btn").click(function (e) {
      if ($("#pnum").val() == "" || $("#pname").val() == "" || $("#price").val() == "" || $("#quantity").val() == "" || $("#snum").val() == "") {
        $("#modal1").fadeIn();
      } else {
        $("#modal").fadeIn();
      }
    });
  });
  $(document).ready(function () {
    $("#modal_close_btn").click(function () {
      $("#modal").fadeOut();
    });
    $("#modal_close_btn1").click(function () {
      $("#modal1").fadeOut();
    });
  });
</script>


  <div class="content">
    <form action="/prod/register" method="post">
      <div class="row">
        <div class="col-md-8">
          <div class="card">
            <div class="card-header">
              <h5 class="title">제품 등록</h5>
            </div>
            <div class="card-body">

              <div class="row">
                <div class="col-md-5 pr-md-1">
                  <div class="form-group">
                    <label>제품번호</label>
                    <input type="text" class="form-control" name="pnum" id="pnum">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-5 pr-md-1">
                  <div class="form-group">
                    <label>제품명</label>
                    <input type="text" class="form-control" name="pname" id="pname">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-5 pr-md-1">
                  <div class="form-group">
                    <label>가격</label>
                    <input type="text" class="form-control" name="price" id="price">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-5 pr-md-1">
                  <div class="form-group">
                    <label>수량</label>
                    <input type="text" class="form-control" name="quantity" id="quantity">
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-5 pr-md-1">
                  <div class="form-group">
                    <label>매장번호</label>
                    <input type="text" class="form-control" name="snum" id="snum">
                  </div>
                </div>
              </div>

              <div class="card-footer">
                
                <button type="button" id="modal_opne_btn" class="btn btn-fill btn-info">전송</button>
                <button type="button" onclick="location.href='/prod/list' "
                  class="btn btn-fill btn-info">목록보기</button>
              </div>

              <!-- modal start-->
              <div id="modal">    
                    <div class="modal_content">
                  <div class="modal_layer"></div>
                          <h2>Success</h2>        
                          <p>등록 되었습니다.</p>        
                          <button type="submit" id="modal_close_btn">닫기</button>        
                </div>
              </div>

              <div id="modal1">    
                    <div class="modal_content1">
                  <div class="modal_layer1"></div>
                          <h2>Error</h2>        
                          <p>빈칸을 채워주세요.</p>        
                          <button type="button" id="modal_close_btn1">닫기</button>        
                </div>
              </div>
              <!-- modal end-->

            </div>
          </div>
        </div>
      </div>
    </form>
  </div>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>