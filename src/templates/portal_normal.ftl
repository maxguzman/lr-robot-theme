<!DOCTYPE html>
<#include init />
<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">
<head>
	<title>${the_title} - ${company_name}</title>
	<meta content="initial-scale=1.0, width=device-width" name="viewport" />
	<@liferay_util["include"] page=top_head_include />
	<link rel="stylesheet" href="${css_folder}/owl.carousel.min.css">
	<link rel="stylesheet" href="${css_folder}/owl.theme.default.min.css">
	<style type="text/css">
		.owl-dots {
			position: relative;
			z-index: 1;
			margin-top: -30px !important;
			left: 20px;
			margin-left: auto;
		}
	</style>
</head>

<body class="${css_class} homepage">
	<@liferay_ui["quick-access"] contentId="#main-content" />
	<@liferay_util["include"] page=body_top_include />
	<@liferay.control_menu />
	<div class="container-fluid" id="wrapper">
		<div id="page-wrapper">
		<!-- Header -->
			<header id="header">
				<div class="logo container">
					<div>
						<h1><a href="${site_default_url}" id="logo">Robot</a></h1>
						<#assign url = theme_display.getURLCurrent() /><br>
						<#assign url2 = theme_display.getURLHome() />
						<p>is using Portal</p>
					</div>
				</div>
			</header>

		<!-- Nav -->
			<#if has_navigation && is_setup_complete>
				<#include "${full_templates_path}/navigation.ftl" />
			</#if>
			
		<!-- Carousel -->	
			<#if theme_display.getURLCurrent() == "/" || theme_display.getURLCurrent()=="/web/guest/home">
				<div class="owl-carousel owl-theme">
					<div><img src="${images_folder}/background1.jpg" alt=""></div>
					<div><img src="${images_folder}/background2.jpg" alt=""></div>
					<div><img src="${images_folder}/background3.jpg" alt=""></div>
				</div>
			</#if>

		<!-- Main Content -->
			<div id="main-wrapper">
				<div id="main" class="container">
					<#if selectable>
						<@liferay_util["include"] page=content_include />
					<#else>
						${portletDisplay.recycle()}
						${portletDisplay.setTitle(the_title)}
						<@liferay_theme["wrap-portlet"] page="portlet.ftl">
							<@liferay_util["include"] page=content_include />
						</@>
					</#if>
				</div>
			</div>

		<!-- Footer -->
			<footer id="footer" class="container">
				<div class="row 200%">
					<div class="12u">
						<!-- About -->
							<section>
								<h2 class="major"><span>Here is the footer</span></h2>
								<p>
									You can add <strong>further info</strong> to this footer.
								</p>
							</section>
					</div>
				</div>
				<div class="row 200%">
					<div class="12u">
						<!-- Contact -->
							<section>
								<h2 class="major"><span>Find us on social media</span></h2>
								<ul class="contact">
									<li><a class="icon fa-facebook" href="#"><span class="label">Facebook</span></a></li>
									<li><a class="icon fa-twitter" href="#"><span class="label">Twitter</span></a></li>
									<li><a class="icon fa-instagram" href="#"><span class="label">Instagram</span></a></li>
									<li><a class="icon fa-google-plus" href="#"><span class="label">Google+</span></a></li>
								</ul>
							</section>
					</div>
				</div>
				<!-- Copyright -->
					<div id="copyright">
						<ul class="cmenu">
							<li>Copyright &copy; Robot Dream 2017. All right reserved.</li>
							<li>
								<#if !is_signed_in>
								<a data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
								</#if>
								<#if is_signed_in>
								<a href="${sign_out_url}" id="sign-out" rel="nofollow">${sign_out_text}</a>
								</#if>
							</li>
						</ul>
					</div>
			</footer>
		</div>	
	</div>
	<@liferay_util["include"] page=body_bottom_include />
	<@liferay_util["include"] page=bottom_include />
	<!-- inject:js -->
	<script src="${javascript_folder}/jquery-3.2.1.min.js"></script>
	<script src="${javascript_folder}/jquery.dropotron.min.js"></script>
	<script src="${javascript_folder}/skel.min.js"></script>
	<script src="${javascript_folder}/skel-viewport.min.js"></script>
	<script src="${javascript_folder}/util.js"></script>
	<script src="${javascript_folder}/owl.carousel.min.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="${javascript_folder}/dp-main.js"></script>
	<!-- endinject -->
</body>
</html>