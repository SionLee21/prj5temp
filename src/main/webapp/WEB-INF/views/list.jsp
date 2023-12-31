<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Potato market</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<main>
    <section class="py-5 text-center container">
        <div class="row py-lg-5">
            <div class="col-lg-6 col-md-8 mx-auto">
                <h1 class="fw-light">감자마켓</h1>
                <p class="lead text-muted">Final Project</p>
                <p>
                    <a href="add" class="btn btn-primary my-2">내 물건 팔기</a>
                </p>
            </div>
        </div>
    </section>

    <div class="py-5 bg-light">
        <div class="container">
            <c:forEach items="${list}" var="u">

                <div class="row row-cols-3 g-3">
                    <div class="col mx-auto">
                        <div class="card shadow-sm">
                            <div class="card-header">
                                <div class="d-flex justify-content-between align-items-center">
                                    <!-- 왼쪽: 제품명 -->
                                    <span>${u.productName}</span>

                                    <!-- 오른쪽: 별명 -->
                                    <span>${u.nickname}</span>
                                </div>

                            </div>
                            <img src="${pageContext.request.contextPath}/uploads/${u.image_url}" class="card-img" alt="!!THERE IS NO IMAGE!!">

                            <div class="card-body">
                                <div class="d-flex justify-content-end align-items-center">
                                    <div class="me-auto p-2">${u.description}</div>
                                    <span class="px-2" id="loveNum${u.seq}">${u.likecount}</span>
                                    <button type="button" class="btn btn-outline-danger" onclick="javascript:love('${u.seq}')">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-heart-fill" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z"/>
                                        </svg>
                                    </button>
                                </div>
                                <div class="me-auto">${u.price}원</div>
                                <c:if test="${u.prod_condition != null}">
                                    <small class="text-dark">Condition: ${u.prod_condition}</small>
                                </c:if>
                                <c:if test="${u.prod_condition == null}">
                                    <small class="text-dark">Condition: Not specified</small>
                                </c:if>
                                <div class="d-flex justify-content-between align-items-center">
                                    <small class="text-muted">${u.registration_date}</small>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-sm btn-outline-success" onclick="javascript:edit_ok('${u.seq}')">수정</button>
                                        <button type="button" class="btn btn-sm btn-outline-danger" onclick="javascript:delete_ok('${u.seq}')">삭제</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <br><br><br>
            </c:forEach>
        </div>
    </div>
</main>

<footer class="text-muted py-5">
    <div class="container">
        <p class="float-end mb-1">
            <a href="#">Back to top</a>
        </p>
        <div class="col-sm-8 col-md-7 py-4">
            <h4 class="text-dark">Creators</h4>
            <p class="text-muted">이예은 22200550<br>이시온 22200538</p>
        </div>
    </div>
</footer>

<script>
    function delete_ok(id) {
        let pw = prompt("Enter pw", "");
        if (pw != null && pw != "") {
            location.href = "delete/" + id + "?pw=" + pw;
        }
    }

    function edit_ok(id) {
        let pw = prompt("Enter pw", "");
        if (pw != null && pw != "") {
            location.href = "editpost/" + id + "?pw=" + pw;
        }
    }

    function love(seq) {
        const xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById("loveNum" + seq).innerHTML = this.responseText;
            }
        };
        xhttp.open("GET", "like?q=" + seq, true);
        xhttp.send();
    }
</script>

</body>
</html>
