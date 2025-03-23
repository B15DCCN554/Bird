<%@page import="model.entities.Shop"%>
<%@page import="model.entities.Comment"%>
<%@page import="model.entities.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/assets/css/stylePageProduct.css">
<style type="text/css">
.product-info-tabs>.nav>li {
	padding: 0;
}

.row {
	margin-top: 60px;
}
</style>
</head>
<body>
	<%@ include file="Pages/MasterPage/Header.jsp"%>

	<%
	Product p = (Product) request.getAttribute("product");
	Shop shop = (Shop) request.getAttribute("shop");
	ArrayList<Comment> commentList =(ArrayList<Comment>) request.getAttribute("comments");
	%>

	<div class="container">
		<div class="heading-section"></div>
		<div class="row">
			<div class="col-md-6">
				<div id="slider" class="owl-carousel product-slider">
					<div class="item">
						<img src="<%=p.getUrl()%>" />
					</div>
					<div class="item">
						<img src="<%=p.getUrl()%>" />
					</div>
					<div class="item">
						<img src="<%=p.getUrl()%>" />
					</div>
					<div class="item">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw" />
					</div>
					<div class="item">
						<img src="<%=p.getUrl()%>" />
					</div>
					<div class="item">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQI6nUmObt62eDkqNSmIvCN_KkQExtbpJmUbVx_eTh_Y3v3r-Jw" />
					</div>
				</div>
				<div id="thumb" class="owl-carousel product-thumb">
					<div class="item">
						<img src="https://trungtamnhietdoivietnga.com.vn/Upload/Viensinhthai/cao-cat-bung-trang-2.jpg" />
					</div>
					<div class="item">
						<img src="https://trungtamnhietdoivietnga.com.vn/Upload/news/garrulax-annamensis.jpg" />
					</div>
					<div class="item">
						<img src="https://trungtamnhietdoivietnga.com.vn/Upload/news/garrulax-annamensis.jpg" />
					</div>
					<div class="item">
						<img src="https://trungtamnhietdoivietnga.com.vn/Upload/Viensinhthai/cao-cat-bung-trang-1.jpg" />
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="product-dtl">
					<div class="product-info">
						<div class="product-name"><%=p.getProduct()%></div>	
					</div>
					<p>Cao cát bụng trắng, tên khoa học - Anthracoceros albirostris (Shaw & Nodder, 1807), tên tiếng Anh - Oriental Pied Hornbill.
					 Là một loài chim thuộc họ Hồng hoàng (Bucerotidae) trong bộ Hồng hoàng (Bucerotiformes).
					 Đây là loài chim có kích thước tương đối lớn, với tổng chiều dài cơ thể từ 68 đến 70 cm. Chim có phần dưới ngực, họng, dưới đuôi, phần mút các lông đuôi ngoài, mép cánh, phần gốc và mút các lông cánh sơ cấp, trừ hai lông ngoài cùng và mút các lông cánh thứ cấp màu trắng. Toàn bộ các phần còn lại của bộ lông màu đen. Mỏ có cấu tạo hai tầng màu vàng nhạt, phần giữa hai tầng và chóp tầng trên của mỏ màu đen. Chim càng già tầng mỏ trên càng cao và dài. Hai bên họng có đám da trần. Mắt nâu đỏ. Da trần quanh mắt màu xanh nhạt hay xanh ánh đỏ. Phần họng có đám da màu xanh phớt tím.</p>
					
					
				</div>
			</div>
		</div>
		<div class="shop_owner">
			<div class="decoration_shop">
				<div class="avatar_shop">
					<img
						src="<%=shop.getUrlAvatar() %>"
						alt=""
						style="border-radius: 50%; border: 2px solid #777777; width: 80px; margin: 20px;">
				</div>
				<div class="set_shop">
					<div class="name_shop">
						<h2 style="margin: 10px; padding: 0;"><%=shop.getNameShop() %></h2>
					</div>
					<div class="button_shop">
						<button style="background-color: #FF9966; color: #ee4d2d;">
							CHAT NGAY <i class="fa fa-commenting" aria-hidden="true"></i>
						</button>
						<button style="background-color: #FFFF; color: #777777;">
							GHÉ THĂM <i class="fa fa-home" aria-hidden="true"></i>
						</button>
					</div>
				</div>
			</div>
			<div class="status_shop">
				<p>
					Đánh giá <span>74.6K</span>
				</p>
				<p>
					Tỉ lệ phản hồi <span>94.4%</span>
				</p>
				<p>
					Số người theo dõi <span><%=shop.getNumFollower() %></span>
				</p>
			</div>
		</div>
		<div class="product-info-tabs">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
				<li class="nav-item"><a class="nav-link active"
					id="description-tab" data-toggle="tab" href="#description"
					role="tab" aria-controls="description" aria-selected="true">Mô
						Tả</a></li>
				<li class="nav-item"><a class="nav-link" id="review-tab"
					data-toggle="tab" href="#review" role="tab" aria-controls="review"
					aria-selected="false">Đánh Giá (<%=commentList.size()%>)
				</a></li>
			</ul>
	
			<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active" id="description"
					role="tabpanel" aria-labelledby="description-tab">Lorem ipsum
					dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
					incididunt ut labore et dolore magna aliqua. Ut enim ad minim
					veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip
					ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
					voluptate velit esse cillum dolore eu fugiat nulla pariatur.
					Excepteur sint occaecat cupidatat non proident, sunt in culpa qui
					officia deserunt mollit anim id est laborum. Sed ut perspiciatis
					unde omnis iste natus error sit voluptatem accusantium doloremque
					laudantium, totam rem aperiam.</div>
				<div class="tab-pane fade" id="review" role="tabpanel"
					aria-labelledby="review-tab">
					<div class="review-heading">Đánh Giá</div>
					<div>

						<%
						Client clientComment;
						if (commentList != null && commentList.size() != 0) {
							for (Comment comment : commentList) {
								clientComment = ClientBO.getClientById(comment.getClientID());
						%>
						<div>
							<img alt=""
								src="http://windows79.com/wp-content/uploads/2021/02/Thay-the-hinh-dai-dien-tai-khoan-nguoi-dung-mac.png"
								width="60px">
							<h1 style="font-size: 20px; display: contents"><%=clientComment.getFullName()%></h1>

							<p><%=comment.getDatetime()%></p>
							<p class="mb-20"><%=comment.getComment()%></p>
						</div>
						<%
						}

						} else
						out.print("<p class=\"mb-20\">There are no reviews yet.</p>");
						%>
					</div>
					<form class="review-form"
						<%=client != null ? "method=\"post\"" : "action=\"SignUpIn\""%>>
						<div class="form-group">
							<label>Đánh giá của bạn</label>
							<div class="reviews-counter">
								<div class="rate">
									<input type="radio" id="star5" name="rate" value="5" /> <label
										for="star5" title="text">5 stars</label> <input type="radio"
										id="star4" name="rate" value="4" /> <label for="star4"
										title="text">4 stars</label> <input type="radio" id="star3"
										name="rate" value="3" /> <label for="star3" title="text">3
										stars</label> <input type="radio" id="star2" name="rate" value="2" />
									<label for="star2" title="text">2 stars</label> <input
										type="radio" id="star1" name="rate" value="1" /> <label
										for="star1" title="text">1 star</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label>Nội Dung</label>
							<textarea class="form-control" rows="10" name="comment"></textarea>
							
							<input style="display: none" name='id' value=" <%=  p.getId()%>">
						</div>					
						<button onclick="showAlert()" class="round-black-btn">Gửi Bình Luận</button>
					</form>
				</div>
			</div>
		</div>

	</div>
	<script>
		function showAlert() {
			alert("Cảm ơn bạn đã phản hồi về sản phẩm!");
		}
	</script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity=" sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script>
		$(document)
				.ready(
						function() {
							var slider = $("#slider");
							var thumb = $("#thumb");
							var slidesPerPage = 4; //globaly define number of elements per page
							var syncedSecondary = true;
							slider.owlCarousel({
								items : 1,
								slideSpeed : 2000,
								nav : false,
								autoplay : false,
								dots : false,
								loop : true,
								responsiveRefreshRate : 200
							}).on('changed.owl.carousel', syncPosition);
							thumb
									.on(
											'initialized.owl.carousel',
											function() {
												thumb.find(".owl-item").eq(0)
														.addClass("current");
											})
									.owlCarousel(
											{
												items : slidesPerPage,
												dots : false,
												nav : true,
												item : 4,
												smartSpeed : 200,
												slideSpeed : 500,
												slideBy : slidesPerPage,
												navText : [
														'<svg width="18px" height="18px" viewBox="0 0 11 20"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M9.554,1.001l-8.607,8.607l8.607,8.606"/></svg>',
														'<svg width="25px" height="25px" viewBox="0 0 11 20" version="1.1"><path style="fill:none;stroke-width: 1px;stroke: #000;" d="M1.054,18.214l8.606,-8.606l-8.606,-8.607"/></svg>' ],
												responsiveRefreshRate : 100
											}).on('changed.owl.carousel',
											syncPosition2);
							function syncPosition(el) {
								var count = el.item.count - 1;
								var current = Math.round(el.item.index
										- (el.item.count / 2) - .5);
								if (current < 0) {
									current = count;
								}
								if (current > count) {
									current = 0;
								}
								thumb.find(".owl-item").removeClass("current")
										.eq(current).addClass("current");
								var onscreen = thumb.find('.owl-item.active').length - 1;
								var start = thumb.find('.owl-item.active')
										.first().index();
								var end = thumb.find('.owl-item.active').last()
										.index();
								if (current > end) {
									thumb.data('owl.carousel').to(current, 100,
											true);
								}
								if (current < start) {
									thumb.data('owl.carousel').to(
											current - onscreen, 100, true);
								}
							}
							function syncPosition2(el) {
								if (syncedSecondary) {
									var number = el.item.index;
									slider.data('owl.carousel').to(number, 100,
											true);
								}
							}
							thumb.on("click", ".owl-item", function(e) {
								e.preventDefault();
								var number = $(this).index();
								slider.data('owl.carousel').to(number, 300,
										true);
							});

							$(".qtyminus").on("click", function() {
								var now = $(".qty").val();
								if ($.isNumeric(now)) {
									if (parseInt(now) - 1 > 0) {
										now--;
									}
									$(".qty").val(now);
								}
							})
							$(".qtyplus").on("click", function() {
								var now = $(".qty").val();
								if ($.isNumeric(now)) {
									$(".qty").val(parseInt(now) + 1);
								}
							});
						});
	</script>
</body>
</html>