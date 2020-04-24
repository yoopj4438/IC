<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
    crossorigin="anonymous"></script>

<script>
    $(document).ready(function () {
        $(".btnModify").on("click", function (e) {
            if ($(this).attr("type") != "submit") {
                e.preventDefault();
                $(this).closest("tr").find("input").removeAttr("readonly");
                $(this).closest("tr").find("input").removeAttr("style");
                $(this).attr("type", "submit");
            }
        });
    });
    $(document).ready(function () {
        var formObj = $("form");
        $(".btnDelete").on("click", function (e) {
            e.preventDefault();
            var pnum = $(this).data("num");
            formObj.each(function (i) {
                if ($(this).attr("id") == pnum) {
                    $(this).attr("action", "/prod/delete").submit();
                }
            });
        });
    });
</script>
<div class="content">
    <div class="row">
        <div class="col-md-12">
            <div class="card ">
                <div class="card-header">
                    <h4 class="card-title">Product List</h4>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table tablesorter " id="">
                            <thead class=" text-primary">
                                <tr>
                                    <th>제품번호</th>
                                    <th>제품명</th>
                                    <th>가격</th>
                                    <th>수량</th>
                                    <th>매장번호</th>
                                    <th colspan="2"></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="prod">
                                    <tr data-num="${prod.pnum }">
                                        <form id="${prod.pnum }" action="/prod/modify" method="post">
                                            <td>
                                                <c:out value="${prod.pnum}" />
                                            </td>
                                            <td><input type="text" name="pname" value="${prod.pname}" readonly="readonly" style="border: none"></td>
                                            <td><input type="text" name="price" value="${prod.price}" readonly="readonly" style="border: none"></td>
                                            <td><input type="text" name="quantity" value="${prod.quantity}" readonly="readonly" style="border: none"></td>
                                            <td><input type="text" name="snum" value="${prod.snum}" readonly="readonly" style="border: none"></td>
                                            <input type="hidden" name="pnum" value="${prod.pnum }">
                                            <td><button type="button" class="btnModify">수정</button></td>
                                            <td><button type="submit" class="btnDelete" data-oper="delete" data-num="${prod.pnum }">삭제</button></td>
                                        </form>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</table>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>