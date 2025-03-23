
<%@page import="model.BOs.ClientBO"%>
<%@page import="model.BOs.CategoryBO"%>
<%@page import="model.BOs.CartBO"%>
<%@page import="model.entities.Category"%>
<%@page import="model.entities.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.entities.Product"%>
<%@page import="model.entities.Client"%>
<%@page import="common.Constants"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
        }
        .top-bar {
            background: #2c70b1;
            color: white;
            padding: 5px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
        }
        .top-bar a {
            color: white;
            text-decoration: none;
            margin-left: 10px;
        }
        .header {
            background: url('/WebShop/style/assets/images/logoShop/bg-headtop.png') no-repeat center/cover;
            color: white;
            padding: 15px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .header .logo {
            display: flex;
            align-items: center;
        }
        .header img {
            height: 70px;
            margin-right: 15px;
        }
        .header h1 {
            font-size: 24px;
            margin: 0;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
        }
        .header .actions {
            display: flex;
            align-items: center;
        }
        .header .search-box input {
            padding: 5px;
            width: 200px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 10px;
        }
        .header .login-btn {
            background: #ff5e00;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            transition: 0.3s;
        }
        .header .login-btn:hover {
            background: #e04e00;
        }
    </style>
</head>
<body>
    <div class="top-bar">
        <div>
            <i class="fa fa-phone"></i> Hotline: (84-4)38363906 &nbsp; | &nbsp;
            <i class="fa fa-map-marker-alt"></i> 63 Nguyễn Văn Huyên, Nghĩa Đô, Cầu Giấy, Hà Nội
        </div>
        <div>
            <a href="#">Email</a>
            <a href="#"><img src="/WebShop/style/assets/images/logoShop/lang-vn.png" alt="VN" width="20"></a>
            <a href="#"><img src="/WebShop/style/assets/images/logoShop/lang-nga.png" alt="RU" width="20"></a>
            <a href="#"><img src="/WebShop/style/assets/images/logoShop/lang-anh.png" alt="EN" width="20"></a>
        </div>
    </div>
    <div class="header">
        <div class="logo">
            <img src="/WebShop/style/assets/images/logoShop/logo5-vi.png" alt="TRUNG TÂM NHIỆT ĐỚI VIỆT - NGA">
            <h1>TRUNG TÂM NHIỆT ĐỚI VIỆT - NGA</h1>
        </div>
        <div class="actions">
            <div class="search-box">
                <input type="text" placeholder="Tìm kiếm">
            </div>
            <button class="login-btn">Đăng nhập</button>
        </div>
    </div>
    <div style="padding-top:50px"></div>
</body>

<%
HttpSession ses = request.getSession();
String accesser = (String) ses.getAttribute("accesser");
Client client = null;
ArrayList<Cart> itemsCartList = new ArrayList<Cart>();
ArrayList<Category> categoryList = new ArrayList<Category>();
categoryList = CategoryBO.getCategorysInData();
if (accesser != null && accesser.equals("user")) {
	client = (Client) ses.getAttribute("user");
	client = client != null ? ClientBO.getClientById(client.getId()) : null;
	itemsCartList = client != null ? (ArrayList<Cart>) CartBO.getItemsCartByClient(client.getId()) : null;
	ses.setAttribute("itemsCartList", itemsCartList);
}
%>
