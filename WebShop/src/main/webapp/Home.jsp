<%@page import="model.BOs.ProductBO"%>
<%@page import="model.DAOs.ProductDAO"%>
<%@page import="model.entities.Shop"%>
<%@page import="model.entities.Product"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
ArrayList<Product> productList = new ArrayList<Product>();
ArrayList<Shop> shopList = new ArrayList<Shop>();
shopList = (ArrayList<Shop>) request.getAttribute("shopList");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WebShop</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.3/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick.min.css"
	rel="stylesheet" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.6.0/slick-theme.min.css"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="/WebShop/style/assets/css/stylePageHome.css">

<script type="text/javascript">
        $(document).on('ready', function () {
            $(".Products-hot").slick({
              infinite: true,
              slidesToShow: 6,
              slidesToScroll: 3
          });
        })
  </script>
<style>
.slick-prev:before {
	color: #ee4d2d;
	font-size: 30px;
}

.slick-next:before {
	color: #ee4d2d;
	font-size: 30px;
}

.close {
	display: none;
}
</style>
</head>
<body>
	<%@ include file="/Pages/MasterPage/Header.jsp"%>
	<div id="main-home">
		<%
		if (shopList != null)
			for (Shop shop : shopList) {
				productList = ProductBO.getProductsByShop(shop.getId());
		%>
		<script type="text/javascript">
           $(document).on('ready', function () {
               $("<%=".Shop" + shop.getId()%>
			")
										.slick(
												{
													infinite : true,
													slidesToShow :
		<%if (productList.size() < 5)
	out.print(productList.size());
else
	out.print(3);%>
			,
													slidesToScroll :
		<%if (productList.size() <= 3)
	out.print(2);
else
	out.print(2);%>
			});
							});
		</script>
		<div style="max-width: 100%; background-color: #FFFF;">


			<div class="Products<%=" Shop" + shop.getId()%>">
				<%
				if (productList != null)
					for (Product product : productList) {
				%>
				<a class="Product"
					href="<%=request.getContextPath()%>/Trangchu/Product?id=<%=product.getId()%>">
					<div>
						<span
							class="sale<%if (product.getOriginalPrice().equals(product.getSalePrice()))
	out.print(" close");%>">
							<%
							try {
								out.print(Math.round(
								(1 - Long.parseLong(product.getSalePrice()) * 1.0 / Long.parseLong(product.getOriginalPrice())) * 100.0));
							} catch (Exception e) {
								out.print(0);
							}
							%>%
						</span> <img src="<%=product.getUrl()%>" alt="tainghe-airpod"
							style="max-width: 250px;">
					</div>
					<div class="content--product">
						<div>
							<h4 style="margin: 4px 6px;"><%=product.getFewChar()%></h4>
						</div>
					</div>
				</a>

				<%
				}
				%>
			</div>

		</div>
		<%
		}
		%>
	</div>
	</div>
	<script>
    function showAlert() {
      alert("Thêm vào giỏ hàng thành công!");
    }
    </script>
	<%@ include file="/Pages/MasterPage/Footer.jsp"%>
	<script type="text/javascript"
		src="/WebShop/style/assets/js/js-pageHome.js"></script>
</body>
</html>