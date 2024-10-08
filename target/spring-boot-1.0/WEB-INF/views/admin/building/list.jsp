<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="display" uri="http://displaytag.sf.net" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:url var="formUrl" value="/admin/building-list"/>
<!DOCTYPE html>
<html>
    <head>
        <title>Danh sách tòa nhà</title>
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
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                 class="bi bi-house-fill" viewBox="0 0 16 16">
                                <path d="M8.707 1.5a1 1 0 0 0-1.414 0L.646 8.146a.5.5 0 0 0 .708.708L8 2.207l6.646 6.647a.5.5 0 0 0 .708-.708L13 5.793V2.5a.5.5 0 0 0-.5-.5h-1a.5.5 0 0 0-.5.5v1.293z"/>
                                <path d="m8 3.293 6 6V13.5a1.5 1.5 0 0 1-1.5 1.5h-9A1.5 1.5 0 0 1 2 13.5V9.293z"/>
                            </svg>
                            <a href="#">Trang chủ </a>
                        </li>
                        <li>Danh sách tòa nhà</li>
                    </ul><!-- /.breadcrumb -->


                </div>

                <div class="page-content" style="font-family: sans-serif;">


                    <div class="page-header">
                        <h1>
                            Danh sách tòa nhà
                        </h1>
                    </div><!-- /.page-header -->

                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="col-xs-12">
                                <div class="widget-box">
                                    <div class="widget-header">
                                        <h4 class="widget-title">Tìm kiếm</h4>

                                        <span class="widget-toolbar">

											<a href="#" data-action="reload">
												<i class="ace-icon fa fa-refresh"></i>
											</a>

											<a href="#" data-action="collapse">
												<i class="ace-icon fa fa-chevron-up"></i>
											</a>

											<a href="#" data-action="close">
												<i class="ace-icon fa fa-times"></i>
											</a>
										</span>
                                    </div>

                                    <div class="widget-body">
                                        <div class="widget-main">
                                            <form:form modelAttribute="modelSearch" action="/admin/building-list"
                                                       id="listForm" method="get">
                                                <div class="row">
                                                    <div class="form-group">
                                                        <div class="col-xs-12">
                                                            <div class="col-xs-6">
                                                                <div>
                                                                    <label for="name">Tên tòa nhà</label>
                                                                    <form:input class="form-control" path="name"
                                                                                placeholder="Tên tòa nhà..."></form:input>
                                                                </div>
                                                            </div>

                                                            <div class="col-xs-6">
                                                                <div>
                                                                    <label for="floorArea">Diện tích sàn</label>
                                                                    <form:input class="form-control"
                                                                                path="floorArea"></form:input>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-xs-12">
                                                            <div class="col-xs-2">
                                                                <div>
                                                                    <label for="district">Quận</label>
                                                                    <form:select path="district" class="form-control">
                                                                        <form:option
                                                                                value="">--Chọn quận--</form:option>
                                                                        <form:options
                                                                                items="${districtCode}"></form:options>
                                                                    </form:select>
                                                                </div>
                                                            </div>

                                                            <div class="col-xs-5">
                                                                <div>
                                                                    <label for="ward">Phường</label>
                                                                    <form:input class="form-control"
                                                                                path="ward"></form:input>
                                                                </div>
                                                            </div>

                                                            <div class="col-xs-5">
                                                                <div>
                                                                    <label for="street">Đường</label>
                                                                    <form:input class="form-control"
                                                                                path="street"></form:input>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-xs-12">
                                                            <div class="col-xs-4">
                                                                <div>
                                                                    <label for="numberOfBasement">Số tầng hầm</label>
                                                                    <form:input class="form-control"
                                                                                path="numberOfBasement"></form:input>
                                                                </div>
                                                            </div>

                                                            <div class="col-xs-4">
                                                                <div>
                                                                    <label for="direction">Hướng</label>
                                                                    <form:input class="form-control"
                                                                                path="direction"></form:input>
                                                                </div>
                                                            </div>

                                                            <div class="col-xs-4">
                                                                <div>
                                                                    <label for="level">Hạng</label>
                                                                    <form:input class="form-control"
                                                                                path="level"></form:input>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-xs-12">
                                                            <div class="col-xs-3">
                                                                <div>
                                                                    <label for="startRentArea">Diện tích từ</label>
                                                                    <form:input class="form-control"
                                                                                path="startRentArea"></form:input>
                                                                </div>
                                                            </div>

                                                            <div class="col-xs-3">
                                                                <div>
                                                                    <label for="end-rent-area">Diện tích đến</label>
                                                                    <form:input class="form-control"
                                                                                path="endRentArea"></form:input>
                                                                </div>
                                                            </div>

                                                            <div class="col-xs-3">
                                                                <div>
                                                                    <label for="start-rent-price">Giá thuê từ</label>
                                                                    <form:input class="form-control"
                                                                                path="startRentPrice"></form:input>
                                                                </div>
                                                            </div>

                                                            <div class="col-xs-3">
                                                                <div>
                                                                    <label for="endRentPrice">Giá thuê đến</label>
                                                                    <form:input class="form-control"
                                                                                path="endRentPrice"></form:input>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-xs-12">

                                                            <div class="col-xs-5">
                                                                <div>
                                                                    <label for="managerName">Tên quản lý</label>
                                                                    <form:input class="form-control"
                                                                                path="managerName"></form:input>
                                                                </div>
                                                            </div>

                                                            <div class="col-xs-5">
                                                                <div>
                                                                    <label for="managerPhone">SĐT quản
                                                                        lý</label>
                                                                    <form:input class="form-control"
                                                                                path="managerPhone"></form:input>
                                                                </div>
                                                            </div>

                                                            <div class="col-xs-2">
                                                                <div>
                                                                    <label for="staffId">Chọn nhân viên</label>
                                                                    <form:select path="staffId" class="form-control">
                                                                        <form:option
                                                                                value="">--Chọn nhân viên--</form:option>
                                                                        <form:options items="${staffs}"></form:options>
                                                                    </form:select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-xs-12">
                                                            <div class="col-xs-5">
                                                                <form:checkboxes path="type" items="${rentType}"
                                                                                 cssStyle="margin-left: 10px"></form:checkboxes>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="form-group">
                                                        <div class="col-xs-12">
                                                            <div class="col-xs-2">
                                                                <button class="btn btn-sm btn-primary" type="button"
                                                                        id="btn-search">Tìm
                                                                    kiếm &thinsp;<i
                                                                            class="ace-icon glyphicon glyphicon-search"></i>
                                                                </button>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                    <div class="pull-right">
                                        <a href="/admin/building-edit">
                                            <button class="btn btn-app btn-success btn-xs"
                                                    title="Thêm tòa nhà">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                     fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                                    <path
                                                            d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                                    <path
                                                            d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                                    <path
                                                            d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                                </svg>
                                            </button>
                                        </a>
                                        <button class="btn btn-app btn-danger btn-xs" title="Xóa tòa nhà"
                                                id="btn-delete-buildings">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                                <path
                                                        d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                                <path
                                                        d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                                <path
                                                        d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                            </svg>
                                        </button>
                                    </div>
                                </div>
                            </div><!-- /.span -->
                            <!-- PAGE CONTENT ENDS -->
                        </div><!-- /.col -->
                    </div><!-- /.row -->

                    <div class="hr hr-18 dotted hr-double"></div>

                    <!-- Table -->
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="table-responsive">
                                <%--                            <table id="building-list" class="table table-striped table-bordered table-hover">--%>
                                <%--                                <thead>--%>
                                <%--                                    <tr>--%>
                                <%--                                        <th></th>--%>
                                <%--                                        <th>Tên tòa nhà</th>--%>
                                <%--                                        <th>Địa chỉ</th>--%>
                                <%--                                        <th>Số tầng hầm</th>--%>
                                <%--                                        <th>Tên quản lý</th>--%>
                                <%--                                        <th>Số điện thoại quản lý</th>--%>
                                <%--                                        <th>D.tích sàn</th>--%>
                                <%--                                        <th>D.tích trống</th>--%>
                                <%--                                        <th>Giá thuê</th>--%>
                                <%--                                        <th>Phí dịch vụ</th>--%>
                                <%--                                        <th>Phí MG</th>--%>
                                <%--                                        <th>Thao tác</th>--%>
                                <%--                                    </tr>--%>
                                <%--                                </thead>--%>

                                <%--                                <tbody>--%>
                                <%--                                    <c:forEach items="${buildingList}" var="building">--%>
                                <%--                                        <tr>--%>
                                <%--                                            <td class="center">--%>
                                <%--                                                <label class="pos-rel">--%>
                                <%--                                                    <input type="checkbox" class="ace" value="${building.id}">--%>
                                <%--                                                    <span class="lbl"></span>--%>
                                <%--                                                </label>--%>
                                <%--                                            </td>--%>

                                <%--                                            <td>--%>
                                <%--                                                    ${building.name}--%>
                                <%--                                            </td>--%>
                                <%--                                            <td>${building.address}</td>--%>
                                <%--                                            <td>${building.numberOfBasement}</td>--%>
                                <%--                                            <td>${building.managerName}</td>--%>
                                <%--                                            <td>${building.managerPhone}</td>--%>
                                <%--                                            <td>${building.floorArea}</td>--%>
                                <%--                                            <td>${building.rentArea}</td>--%>
                                <%--                                            <td>${building.rentPrice}</td>--%>
                                <%--                                            <td>${building.serviceFee}</td>--%>
                                <%--                                            <td>${building.brokerageFee}</td>--%>
                                <%--                                            <td>--%>
                                <%--                                                <div class="hidden-sm hidden-xs btn-group">--%>
                                <%--                                                    <button class="btn btn-xs btn-success" title="Giao tòa nhà"--%>
                                <%--                                                            onclick="assignBuilding(${building.id})">--%>
                                <%--                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"--%>
                                <%--                                                             fill="currentColor" class="bi bi-check-lg"--%>
                                <%--                                                             viewBox="0 0 16 16">--%>
                                <%--                                                            <path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425z"/>--%>
                                <%--                                                        </svg>--%>
                                <%--                                                    </button>--%>
                                <%--                                                    <a href="/admin/building-edit-${building.id}">--%>
                                <%--                                                        <button class="btn btn-xs btn-info" title="Sửa thông tin">--%>
                                <%--                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16"--%>
                                <%--                                                                 height="16" fill="currentColor"--%>
                                <%--                                                                 class="bi bi-pencil-fill" viewBox="0 0 16 16">--%>
                                <%--                                                                <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"/>--%>
                                <%--                                                            </svg>--%>
                                <%--                                                        </button>--%>
                                <%--                                                    </a>--%>
                                <%--                                                    <button class="btn btn-xs btn-danger" title="Xóa tòa nhà"--%>
                                <%--                                                            onclick="deleteOneBuilding(${building.id})">--%>
                                <%--                                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"--%>
                                <%--                                                             fill="currentColor" class="bi bi-trash-fill"--%>
                                <%--                                                             viewBox="0 0 16 16">--%>
                                <%--                                                            <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>--%>
                                <%--                                                        </svg>--%>
                                <%--                                                    </button>--%>

                                <%--                                                </div>--%>
                                <%--                                            </td>--%>
                                <%--                                        </tr>--%>
                                <%--                                    </c:forEach>--%>
                                <%--                                </tbody>--%>
                                <%--                            </table>--%>

                                <display:table name="model.listResult" cellspacing="0" cellpadding="0"
                                               requestURI="${formUrl}"
                                               partialList="true" sort="external"
                                               size="${model.totalItems}" defaultsort="2" defaultorder="ascending"
                                               id="tableList" pagesize="${model.maxPageItems}"
                                               export="false"
                                               class="table table-fcv-ace table-striped table-bordered table-hover dataTable no-footer"
                                               style="margin: 3em 0 1.5em;">
                                    <display:column title="<fieldset class='form-group'>
												        <input type='checkbox' id='checkAll' class='check-box-element'>
												        </fieldset>" class="center select-cell"
                                                    headerClass="center select-cell">
                                        <fieldset>
                                            <input type="checkbox" name="checkList" value="${tableList.id}"
                                                   id="${tableList.id}" class="check-box-element"/>
                                        </fieldset>
                                    </display:column>
                                    <display:column headerClass="text-left" property="name" title="Tên"/>
                                    <display:column headerClass="text-left" property="address" title="Địa chỉ"/>
                                    <display:column headerClass="text-left" property="numberOfBasement"
                                                    title="Số tầng hầm"/>
                                    <display:column headerClass="text-left" property="managerName" title="Tên quản lý"/>
                                    <display:column headerClass="text-left" property="managerPhone"
                                                    title="SĐT quản lý"/>
                                    <display:column headerClass="text-left" property="floorArea" title="Diện tích sàn"/>
                                    <display:column headerClass="text-left" property="rentArea"
                                                    title="Diện tích trống"/>
                                    <display:column headerClass="text-left" property="rentPrice" title="Giá thuê"/>
                                    <display:column headerClass="text-left" property="serviceFee" title="Phí dịch vụ"/>
                                    <display:column headerClass="text-left" property="brokerageFee" title="Phí MG"/>
                                    <display:column headerClass="col-actions" title="Thao tác">
                                        <div class="hidden-sm hidden-xs btn-group">
                                            <button class="btn btn-xs btn-success" title="Giao tòa nhà"
                                                    onclick="assignBuilding(${tableList.id})">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                     fill="currentColor" class="bi bi-check-lg"
                                                     viewBox="0 0 16 16">
                                                    <path d="M12.736 3.97a.733.733 0 0 1 1.047 0c.286.289.29.756.01 1.05L7.88 12.01a.733.733 0 0 1-1.065.02L3.217 8.384a.757.757 0 0 1 0-1.06.733.733 0 0 1 1.047 0l3.052 3.093 5.4-6.425z"/>
                                                </svg>
                                            </button>
                                            <a href="/admin/building-edit-${tableList.id}">
                                                <button class="btn btn-xs btn-info" title="Sửa thông tin">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16"
                                                         height="16" fill="currentColor"
                                                         class="bi bi-pencil-fill" viewBox="0 0 16 16">
                                                        <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"/>
                                                    </svg>
                                                </button>
                                            </a>
                                            <button class="btn btn-xs btn-danger" title="Xóa tòa nhà"
                                                    onclick="deleteOneBuilding(${tableList.id})">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                     fill="currentColor" class="bi bi-trash-fill"
                                                     viewBox="0 0 16 16">
                                                    <path d="M2.5 1a1 1 0 0 0-1 1v1a1 1 0 0 0 1 1H3v9a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2V4h.5a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H10a1 1 0 0 0-1-1H7a1 1 0 0 0-1 1zm3 4a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5M8 5a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7A.5.5 0 0 1 8 5m3 .5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 1 0"/>
                                                </svg>
                                            </button>

                                        </div>
                                    </display:column>
                                </display:table>
                            </div>
                        </div><!-- /.span -->
                    </div>
                </div><!-- /.page-content -->
            </div>
        </div><!-- /.main-content -->
        <div id="assignBuildingModal" class="modal fade" role="dialog">
            <div class="modal-dialog">

                <!-- Modal content-->
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">Danh sách nhân viên</h4>
                    </div>
                    <div class="modal-body">
                        <table id="staff-list" class="table table-striped table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th class="center">
                                    </th>
                                    <th class="center">Tên nhân viên</th>
                                </tr>
                            </thead>

                            <tbody>


                            </tbody>
                        </table>
                        <input type="hidden" name="buildingid" id="buildingid" value="">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="btn-assign-building">Giao tòa nhà</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Hủy</button>
                    </div>
                </div>

            </div>
        </div>
        <script>
            function assignBuilding(buildingId) {
                $('#assignBuildingModal').modal();
                $("#buildingid").val(buildingId);
                loadStaffs(buildingId);
            }

            function loadStaffs(buildingId) {
                $.ajax({
                    type: "GET",
                    url: "/api/buildings/" + buildingId + "/staffs",
                    dataType: "JSON",				// Kieu du lieu server tra ve client
                    // contentType: "application/json",  // Kieu du lieu gui di
                    success: function (response) {
                        var row = '';
                        $.each(response.data, function (index, item) {
                            row += '<tr>';
                            row += '<td class="center">';
                            row += '<label class="pos-rel">';
                            row += '<input type="checkbox" class="check-box-element" value="' + item.staffId + '"' + item.checked + '>';
                            row += '<span class="lbl"></span>';
                            row += '</label>';
                            row += '</td>';
                            row += '<td class="center">';
                            row += item.fullName;
                            row += '</td>';
                            row += '</tr>';
                        })
                        $("#staff-list tbody").html(row);
                    },
                    error: function () {
                        console.log("fail");
                        alert("Fail to load staffs");
                    }
                })
            }

            $("#btn-assign-building").click(function (e) {
                e.preventDefault();
                var data = {};
                data['buildingId'] = $('#buildingid').val();
                var staffs = $("#staff-list").find("tbody input[type=checkbox]:checked").map(function () {
                    return $(this).val();
                }).get();
                data['staffs'] = staffs;
                console.log("ok");
                sendAssignBuilding(data);
            })

            function sendAssignBuilding(data) {
                $.ajax({
                    type: "POST",
                    url: "/api/buildings/staffs",
                    data: JSON.stringify(data),		// Chuyen doi du lieu gui den sang json
                    dataType: "json",				// Kieu du lieu server tra ve client
                    contentType: "application/json",  // Kieu du lieu gui di
                    success: function (response) {
                        console.log("success");
                        alert(response["message"]);
                        window.location.reload();
                    },
                    error: function () {
                        console.log("fail");
                        alert("Fail to add or update staff assignment");
                    }
                })
            }

            $("#btn-delete-buildings").click(function (e) {
                e.preventDefault();
                var data = {};
                var buildings = $("#tableList").find("tbody input[type=checkbox]:checked").map(function () {
                    return $(this).val();
                }).get();
                data = buildings;
                deleteBuilding(data);
            })

            function deleteBuilding(data) {
                $.ajax({
                    type: "DELETE",
                    url: "/api/buildings/" + data,
                    // data: JSON.stringify(data),		// Chuyen doi du lieu gui den sang json
                    dataType: "json",				// Kieu du lieu server tra ve client
                    contentType: "application/json",  // Kieu du lieu gui di
                    success: function (reponse) {
                        console.log("success");
                        alert(reponse["message"]);
                        window.location.reload();
                    },
                    error: function () {
                        console.log("fail");
                        alert("Fail to delete building");
                    }
                })
            }

            function deleteOneBuilding(id) {
                var data = [];
                data.push(id);
                deleteBuilding(data);
            }

            $("#btn-search").click(function (e) {
                e.preventDefault();
                $("#listForm").submit();
            })
        </script>
    </body>
</html>
