<%@ page contentType="text/html; charset=UTF-8" language="java" %> 


<%@ page import="com.tyndalehouse.step.jsp.WebStepRequest" %>
<%@ page import="com.google.inject.Injector"%>
<%@ page import="com.google.inject.Guice"%>

<%
	Injector injector = (Injector) pageContext.getServletContext().getAttribute(Injector.class.getName());
	WebStepRequest stepRequest = new WebStepRequest(injector, request);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
    <TITLE><%= stepRequest.getVersion(0) %> <%= stepRequest.getReference(0) %>: <%= stepRequest.getTitle() %></TITLE>
    <META http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
	<meta name="description" content="Scripture Tools for Every Person is a Bible study tool, currently showing: <%= stepRequest.getReference(0) %> in the <%= stepRequest.getVersion(0) %> and <%= stepRequest.getReference(1) %> in the <%= stepRequest.getVersion(1) %>">
	<meta name="keywords" content="bible study kjv esv asv scripture tools for every person interlinear strong robinson timeline" />
	
	<!-- used for webmaster tools -->
	<meta name="google-site-verification" content="OZfGjgjfTQq0Gn-m6pecYXYNGoDTllWS6v9aBOi64AU" />
	
	<link rel="shortcut icon"  href="images/step-favicon.ico" />

	<%
		if(request.getParameter("debug") != null) {
	%>

		<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.8.23.custom.css" />
		<link rel="stylesheet" type="text/css" href="css/qtip.css" />
		<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
		<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu-v.css" />
	    <link rel="stylesheet" type="text/css" href="css/initial-layout.css" />
	    <link rel="stylesheet" type="text/css" href="css/initial-fonts.css" />
	    <link rel="stylesheet" type="text/css" href="css/passage.css" />
	    <link rel="stylesheet" type="text/css" href="css/timeline.css" />
	    <link rel="stylesheet" type="text/css" href="css/search.css" />
	    <link rel="stylesheet" type="text/css" href="css/cardo.css" />
		
		<script src="js_init/initLib.js" type="text/javascript"></script>   
	    <script src="libs/dohighlight-min.js" type="text/javascript"></script>
	    <script src="libs/timeline_js/timeline-api.js" type="text/javascript"></script>
	    <script src="libs/jquery-1.8.2.min.js" type="text/javascript"></script>
		<script src="libs/jquery-ui-1.8.23.custom.min.js" type="text/javascript"></script>
<!-- 		<script src="libs/jquery-ui-1.9-beta.min.js" type="text/javascript"></script> -->
	    <script src="js/jquery-extensions/jquery-qtip.js" type="text/javascript"></script>
	    <script src="js/jquery-extensions/jquery-hover-intent.js" type="text/javascript"></script>
	    <script src="js/jquery-extensions/jquery-cookie.js" type="text/javascript"></script>
	    <script src="js/jquery-extensions/jquery-local-store.js" type="text/javascript"></script>
		<script src="js/jquery-extensions/jquery-shout.js" type="text/javascript"></script>
	    <script src="js/jquery-extensions/jquery-versions-complete.js" type="text/javascript"></script>
	    <script src="js/jquery-extensions/jquery-lexical-complete.js" type="text/javascript"></script>
	    <script src="js/jquery-extensions/jquery-detail-slider.js" type="text/javascript"></script>
		<script src="js/ddsmoothmenu.js" type="text/javascript"></script>
	    <script src="js/util.js" type="text/javascript"></script>
	    <script src="js/lexicon_definition.js" type="text/javascript"></script>
	    <script src="js/ui_hooks.js" type="text/javascript"></script>
	    <script src="js/timeline.js" type="text/javascript"></script>
	    <script src="js/geography.js" type="text/javascript"></script>
	    <script src="js/toolbar_menu.js" type="text/javascript"></script>
		<script src="js/defaults/step.defaults.js" type="text/javascript"></script>
		<script src="js/search/step.search.js" type="text/javascript"></script>
		<script src="js/search/step.search.ui.js" type="text/javascript"></script>
		<script src="js/search/step.search.quick.ui.js" type="text/javascript"></script>
		<script src="js/search/step.search.original.ui.js" type="text/javascript"></script>
		<script src="js/search/step.search.simpletext.ui.js" type="text/javascript"></script>
		<script src="js/search/step.search.textual.ui.js" type="text/javascript"></script>
		<script src="js/search/step.search.timeline.ui.js" type="text/javascript"></script>
		<script src="js/search/step.search.subject.ui.js" type="text/javascript"></script>
		<script src="js/navigation/step.navigation.js" type="text/javascript"></script>	    


		<script src="js/state/step.state.js" type="text/javascript"></script>
		<script src="js/state/step.state.view.js" type="text/javascript"></script>
		<script src="js/state/step.state.passage.js" type="text/javascript"></script>
		<script src="js/state/step.state.original.js" type="text/javascript"></script>

	    <script src="js/menu/step.menu.js" type="text/javascript"></script>
	    <script src="js/menu/top/help.js" type="text/javascript"></script>
	    <script src="js/menu/top/tools.js" type="text/javascript"></script>
	    <script src="js/menu/top/view.js" type="text/javascript"></script>
	    <script src="js/menu/top/top.menu.ui.js" type="text/javascript"></script>
	    <script src="js/menu/passage/context.js" type="text/javascript"></script>
	    <script src="js/menu/passage/display.js" type="text/javascript"></script>
	    <script src="js/menu/passage/passageTools.js" type="text/javascript"></script>
	    <script src="js/menu/passage/search.js" type="text/javascript"></script>

	    <script src="js/passage/step.version.js" type="text/javascript"></script>
	    <script src="js/passage/step.passage.js" type="text/javascript"></script>
	    <script src="js/passage/step.passage.ui.js" type="text/javascript"></script>
	    <script src="js/passage/step.passage.navigation.js" type="text/javascript"></script>
	    <script src="js/passage/step.passage.navigation.ui.js" type="text/javascript"></script>
	    <script src="js/bookmark/step.bookmark.js" type="text/javascript"></script>
	    <script src="js/bookmark/step.bookmark.ui.js" type="text/javascript"></script>
	    <script src="js/init.js" type="text/javascript"></script>
	<%
		} else {
	%>
	    <link rel="stylesheet" type="text/css" href="css/step.min.css" />
		<script src="js/step.min.js" type="text/javascript" ></script>
	<%
	}
	%>
</HEAD>
<body>
<div id="topMenu" class="ddsmoothmenu"><jsp:include page="js/menu/top/menu.html" /></div>
<div>
	<div id="middleSection">
		<div class="column leftColumn">
			<div class="passageContainer" passage-id=0>
				<div id="leftPaneMenu" class="innerMenus"><jsp:include page="js/menu/passage/menu.html" /></div>
			    <div class="passageText ui-widget">
			    	<div class="headingContainer">
			    		<jsp:include page="js/search/advanced_search.jsp?passageId=0" />
						<jsp:include page="js/search/passage_toolbar.jsp?passageId=0" />
			    	</div>
			    	<div class="passageContent">&nbsp;<%= stepRequest.getPassage(0) %></div>
			    </div>
			</div>
		</div>
		<div id="holdingPage">
			<h1>STEP<br /> <em>S</em>cripture <em>T</em>ools for <em>E</em>very <em>P</em>erson</h1>
			<img src="images/step-logo-big.png" title="STEP" /><br />
			<em>Stepping into the Bible.</em><br /><br />
			
			<table>
				<tr>
					<td><a href="http://help.step.tyndalehouse.com/quickStart.html" title="A quick tutorial demonstrating how to get started"/>Help manual</a></td>
					<td><a href="versions.jsp" title="Detailed information on how to use the software"/>Available versions</a></td>
				</tr>
				<tr>
					<td><a href="http://help.step.tyndalehouse.com/about.html" title="Find out more about the STEP project developed by Tyndale House"/>About the STEP project</a></td>
					<td><a href="http://help.step.tyndalehouse.com/supportTheProject.html" title="Give your time, skills, etc. towards helping make the STEP project a better tool for everyone" />Support the STEP project</a></td>
				</tr>
			</table>
		</div>
		
		<jsp:include page="js/bookmark/bookmark.jsp"></jsp:include>
			
		<div class="column rightColumn">
			<div class="passageContainer" passage-id=1>
				<div id="rightPaneMenu" class="innerMenus"><jsp:include page="js/menu/passage/menu.html" /></div>
			    <div class="passageText ui-widget">
			    	<div class="headingContainer">
			    		<jsp:include page="js/search/advanced_search.jsp?passageId=1" />
			    		<jsp:include page="js/search/passage_toolbar.jsp?passageId=1" />
			    	</div>
			    	<div class="passageContent">&nbsp;<%= stepRequest.getPassage(1) %></div>
				</div>
			</div>
		</div>
	</div>
	
	<div id="bottomSection" class="bottomModule timeline">
		<div id="bottomModuleHeader" >
			<span class="timelineContext" style="padding-right: 10px"></span>
			<span class="timelineContext" style="float: right;" onclick="step.navigation.hideBottomSection();">Close</span>
		</div>
		<div id="bottomSectionContent" style="clear: both;">	
			No modules have yet been loaded.
		</div>
	</div>
</div>

<div class="interlinearPopup">
	<input type="text" class="interlinearVersions"/>
	<div class="interlinearChoices"></div>
</div>
<div class="interlinearPopup">
	<input type="text" class="interlinearVersions"/>
	<div class="interlinearChoices"></div>
</div>


<!--<div id="loading"><img alt="Loading..." src="images/wait16.gif" />Loading...</div>-->
<div id="error" class="ui-state-error" style="display: none">
	<span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
	<span id="errorText">A placeholder for error messages</span>
</div>

<!--  The about popup -->

<div id="about">
	<img id="aboutLogo" src="images/step-logo.png" />
	<h3 id="aboutTitle">STEP :: Scripture Tools for Every Person</h3>
	<p>&copy; Tyndale House 2011</p>
</div>

<%-- <jsp:include page="jsps/login.jsp"></jsp:include> --%>

<div id="goToDate" style="display: none">
	Please enter a year: <input type="text" id="scrollToYear" />
</div>

<!--  The popup that can have lots of helpful information -->
<jsp:include page="jsps/lexicon_definition.jsp"  />
<img src="images/wait_big.gif" id="waiting" />
<div id="previewReference" style="display: none"><div id="previewBar" style="display: none;">
	<a href="#" id="previewClose">Close this popup</a>
	<a href="#" id="previewRight">See passage on the right pane</a>
	<a href="#" id="previewLeft">See passage on the left pane</a>
</div><span id="popupText"></span></div>

<div id='stepInDevelopmentWarning'>The STEP software and its data are currently under active development and being checked for accuracy. </div>
</body>

</HTML>
