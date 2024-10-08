<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<%@ page import="com.javaweb.security.utils.SecurityUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="navbar" class="navbar navbar-default ace-save-state" style="background-color:#35bf76">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-buildings" viewBox="0 0 16 16">
                        <path d="M14.763.075A.5.5 0 0 1 15 .5v15a.5.5 0 0 1-.5.5h-3a.5.5 0 0 1-.5-.5V14h-1v1.5a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5V10a.5.5 0 0 1 .342-.474L6 7.64V4.5a.5.5 0 0 1 .276-.447l8-4a.5.5 0 0 1 .487.022M6 8.694 1 10.36V15h5zM7 15h2v-1.5a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 .5.5V15h2V1.309l-7 3.5z"/>
                        <path d="M2 11h1v1H2zm2 0h1v1H4zm-2 2h1v1H2zm2 0h1v1H4zm4-4h1v1H8zm2 0h1v1h-1zm-2 2h1v1H8zm2 0h1v1h-1zm2-2h1v1h-1zm0 2h1v1h-1zM8 7h1v1H8zm2 0h1v1h-1zm2 0h1v1h-1zM8 5h1v1H8zm2 0h1v1h-1zm2 0h1v1h-1zm0-2h1v1h-1z"/>
                    </svg>
                    Trang quản trị
                </small>
            </a>
        </div>
        <div class="navbar-buttons navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-10">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        Xin chào, <%=SecurityUtils.getPrincipal().getFullName()%>
                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="/admin/profile-<%=SecurityUtils.getPrincipal().getUsername()%>">
                                <i class="ace-icon fa fa-user"></i>
                                <%--<spring:message code="label.account.information"/>--%>
                                Thông tin tài khoản
                            </a>
                        </li>
                        <li>
                            <a href="<c:url value="/admin/profile-password"/>">
                                <i class="ace-icon fa fa-key"></i>
                                <%--<spring:message code="label.password.change"/>--%>
                                Đổi mật khẩu
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="<c:url value='/logout'/>">
                                <i class="ace-icon fa fa-power-off"></i>
                                Thoát
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>