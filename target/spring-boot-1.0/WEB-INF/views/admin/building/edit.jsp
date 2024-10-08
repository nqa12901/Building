<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Thêm hoặc chỉnh sửa tòa nhà</title>
    </head>
    <body>
        <div class="main-content">
            <div class="main-content-inner">
                <div class="breadcrumbs" id="breadcrumbs">
                    <script type="text/javascript">
                        try {
                            ace.settings.check('breadcrumbs', 'fixed')
                        } catch (e) {
                        }
                    </script>

                    <ul class="breadcrumb">
                        <li>
                            <i class="ace-icon fa fa-home home-icon"></i>
                            <a href="#">Home admin</a>
                        </li>
                        <li class="active">Thông tin tòa nhà</li>
                    </ul><!-- /.breadcrumb -->


                </div>

                <div class="page-content" style="font-family: sans-serif;">


                    <div class="page-header">
                        <h1>
                            Thông tin tòa nhà
                        </h1>
                    </div><!-- /.page-header -->

                    <div class="row" style="font-family: sans-serif; font-size: medium;">
                        <form:form modelAttribute="building" id="form-edit" class="form-horizontal">
                            <div class="col-xs-12">
                                <!-- PAGE CONTENT BEGINS -->
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="name" class="col-xs-3">Tên tòa nhà</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="name"
                                                        placeholder="Tên tòa nhà..."></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="district" class="col-xs-3">Quận</label>
                                        <div class="col-xs-3">
                                            <form:select path="district" class="form-control">
                                                <form:option
                                                        value="">--Chọn quận--</form:option>
                                                <form:options
                                                        items="${districtCode}"></form:options>
                                            </form:select>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="ward" class="col-xs-3">Phường</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="ward"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="street" class="col-xs-3">Đường</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="street"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="structure" class="col-xs-3">Kết cấu</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="structure"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="numberOfBasement" class="col-xs-3">Số tầng hầm</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="numberOfBasement"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="floorArea" class="col-xs-3">Diện tích sàn</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="floorArea"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="direction" class="col-xs-3">Hướng</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="direction"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="level" class="col-xs-3">Hạng</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="level"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="rentArea" class="col-xs-3">Diện tích thuê</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="rentArea" placeholder="100, 200, ..."></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="rentPrice" class="col-xs-3">Giá thuê</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="rentPrice"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="rentPriceDescription" class="col-xs-3">Mô tả giá</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="rentPriceDescription"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="serviceFee" class="col-xs-3">Phí dịch vụ</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="serviceFee"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="carFee" class="col-xs-3">Phí ô tô</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="carFee"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="motoFee" class="col-xs-3">Phí xe máy</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="motoFee"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="overtimeFee" class="col-xs-3">Phí ngoài giờ</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="overtimeFee"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="electricityFee" class="col-xs-3">Tiền điện</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="electricityFee"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="waterFee" class="col-xs-3">Tiền nước</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="waterFee"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="deposit" class="col-xs-3">Đặt cọc</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="deposit"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="payment" class="col-xs-3">Thanh toán</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="payment"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="rentTime" class="col-xs-3">Thời hạn thuê</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="rentTime"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="decorationTime" class="col-xs-3">Thời gian trang trí</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="decorationTime"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="managerName" class="col-xs-3">Tên quản lý</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="managerName"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="managerPhone" class="col-xs-3">Số điện thoại quản
                                            lý</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="managerPhone"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="type" class="col-xs-3">Loại tòa nhà</label>
                                        <div class="col-xs-7">
                                            <form:checkboxes path="type" items="${rentType}"
                                                             cssStyle="margin-left: 10px"></form:checkboxes>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="brokerageFee" class="col-xs-3">Phí môi giới</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="brokerageFee"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <label for="note" class="col-xs-3">Ghi chú</label>
                                        <div class="col-xs-7">
                                            <form:input class="form-control" path="note"></form:input>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-3 no-padding-right">Hình đại diện</label>
                                    <input class="col-sm-3 no-padding-right" type="file" id="uploadImage"/>
                                    <div class="col-sm-9">
                                        <c:if test="${not empty building.image}">
                                            <c:set var="imagePath" value="/repository${building.image}"/>
                                            <img src="${imagePath}" id="viewImage" width="300px" height="300px" style="margin-top: 50px">
                                        </c:if>
                                        <c:if test="${empty building.image}">
                                            <img src="/img/default.jpg" id="viewImage" width="300px" height="300px">
                                        </c:if>
                                    </div>
                                </div>


                                <input type="hidden" name="id" value="${building.id}">
                                <div class="form-group">
                                    <div class="col-xs-12">
                                        <div class="col-xs-3"></div>
                                        <div class="col-xs-7">
                                            <c:if test="${building.id == null}">
                                                <button type="button" class="btn btn-primary" id="btnAddBuilding">Thêm
                                                    tòa nhà
                                                </button>
                                            </c:if>
                                            <c:if test="${building.id != null}">
                                                <button type="button" class="btn btn-warning" id="btnAddBuilding">Sửa
                                                    tòa nhà
                                                </button>
                                            </c:if>
                                            <a href="/admin/building-list">
                                                <button type="button" class="btn btn-danger">Hủy</button>
                                            </a>
                                        </div>
                                    </div>
                                </div>


                                <!-- PAGE CONTENT ENDS -->

                            </div>
                            <!-- /.col -->
                        </form:form>
                    </div><!-- /.row -->

                </div><!-- /.page-content -->
            </div>
        </div><!-- /.main-content -->
        <script>
            var imageBase64 = '';
            var imageName = '';

            $("#btnAddBuilding").click(function () {
                var json = {};
                var type = [];
                var formData = $("#form-edit").serializeArray();
                console.log("ok");
                $.each(formData, function (i, it) {
                    if (it.name != "type")
                        json["" + it.name + ""] = it.value;
                    else
                        type.push(it.value);
                    if ('' !== imageBase64) {
                        json['imageBase64'] = imageBase64;
                        json['imageName'] = imageName;
                    }
                });
                json['type'] = type;
                if (json["name"] === "")
                {
                    alert("Tên tòa nhà không được để trống");
                    return;
                }
                addBuilding(json);
            })

            $('#uploadImage').change(function (event) {
                var reader = new FileReader();
                var file = $(this)[0].files[0];
                reader.onload = function(e){
                    imageBase64 = e.target.result;
                    imageName = file.name; // ten hinh khong dau, khoang cach. vd: a-b-c
                };
                reader.readAsDataURL(file);
                openImage(this, "viewImage");
            });

            function openImage(input, imageView) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#' +imageView).attr('src', reader.result);
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            }

            function addBuilding(data) {
                $.ajax({
                    type: "POST",
                    url: "/api/buildings",
                    data: JSON.stringify(data),		// Chuyen doi du lieu gui den sang json
                    dataType:"json",				// Kieu du lieu server tra ve client
                    contentType: "application/json",  // Kieu du lieu gui di
                    success: function (response) {
                        console.log("success");
                        alert(response["message"]);
                        window.location.replace("/admin/building-list")
                    },
                    error: function () {
                        console.log("fail");
                        alert("Fail to add or update building");
                    }
                })
            }
        </script>
    </body>
</html>
