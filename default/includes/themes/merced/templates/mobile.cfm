<cfoutput>
<!DOCTYPE html> 
<html>
<head>
	<meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="description" content="#HTMLEditFormat($.getMetaDesc())#" />
	<meta name="keywords" content="#HTMLEditFormat($.getMetaKeywords())#" />
	<cfif len($.content('credits'))><meta name="author" content="#HTMLEditFormat($.content('credits'))#" /></cfif>
	<meta name="generator" content="Mura CMS #$.globalConfig('version')#" />
	<meta name="robots" content="noindex, follow" />
	<title>#HTMLEditFormat($.content('HTMLTitle'))# - #HTMLEditFormat($.siteConfig('site'))#</title>

	<link rel="icon" href="#$.siteConfig('assetPath')#/images/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="#$.siteConfig('assetPath')#/images/favicon.ico" type="image/x-icon" />	
	
	<link rel="stylesheet" href="#$.siteConfig('assetPath')#/css/mura.min.css?" />
	<link rel="stylesheet" href="#$.siteConfig('assetPath')#/jquery/mobile/jquery.mobile.min.css" />
	<link rel="stylesheet" href="#$.siteConfig('themeAssetPath')#/css/mobile/mobile.css" />
	
	<script src="#$.siteConfig('assetPath')#/jquery/jquery.js"></script>
	
	<script type="text/javascript">
      $(document).bind("mobileinit", function(){
            $.extend(  $.mobile , { 
                  ajaxEnabled : false,
				  pushStateEnabled : false
             });
      });
	</script>

	<script src="#$.siteConfig('assetPath')#/jquery/mobile/jquery.mobile.min.js"></script>
	<cfset rs=$.getBean('feedManager').getFeeds($.event('siteID'),'Local',true,true) />

</head>

<body id="#$.getTopID()#" class="depth#arrayLen($.event('crumbdata'))#">
<div data-role="page" data-theme="b">
	<cfif $.content('contentID') eq "00000000000000000000000000000000001">
		<h1 id="site-title">#HTMLEditFormat($.siteConfig('site'))#</h1>
	<cfelse>
	<div data-role="header" data-position="inline" data-theme="a">
		<a href="##" id="btn-back" data-icon="arrow-l">Back</a>
		<h1>#HTMLEditFormat($.siteConfig('site'))#</h1>
		<div><a href="#$.createHREF(filename='')#" rel="external" data-role="button" class="ui-btn-right">#$.rbKey("mobile.home")#</a></div>
	</div>
	<!-- /header -->
	</cfif>

	<div data-role="content" id="main">
		<cfif $.content('contentID') neq "00000000000000000000000000000000001"><h2>#HTMLEditFormat($.content('title'))#</h2></cfif>
		<cfif yesNoFormat($.content('hasMobileBody'))>
			#$.dspBody(body=$.content('mobileBody'),pageTitle='',crumbList=0,showMetaImage=0)#
		<cfelse>
			#$.dspBody(body=$.content('body'),pageTitle='',crumbList=0,showMetaImage=0)#
		</cfif>
		
		#$.dspObjects($.siteConfig('primaryColumn'))#
		
		<cfif $.content('contentID') eq "00000000000000000000000000000000001">
		<!---
		<div id="navHeader" class="header-fullscreen" data-role="header" data-nobackbtn="true" data-theme="a">
		<h1>More</h1>
		</div>
		--->
		
		<cf_CacheOMatic key="dspMobilePrimaryNav#$.content('contentID')#">
			#$.dspPrimaryNav(
				viewDepth="0",
				id="navPrimary",
				displayHome="never",
				closePortals="true",
				showCurrentChildrenOnly="false"
				)#
		</cf_cacheomatic>
		<cfelseif not listFindNoCase('Gallery,Portal',$.content('type'))>
		<!---
		<div id="navHeader" class="header-fullscreen" data-role="header" data-nobackbtn="true" data-theme="a">
		<h1>More</h1>
		</div>
		--->
		<div id="navSub">#$.dspSubNav()#</div>
		</cfif>
		
		
	</div><!-- /content -->

		<div data-role="footer"  data-theme="a" class="ui-bar">
				<a href="./?mobileFormat=false" rel="external">#$.rbKey("mobile.fullversion")#</a>
		</div><!-- /footer -->
	
</div><!-- /page -->

<script>
	$('body').live('pagebeforecreate',init);
	
	function init() {
	
	<!--- Primary Nav on Home Screen --->
	$('##navPrimary').attr({
 		'data-role': 'listview',
  		'data-inset': 'false',
  		'data-theme': 'c',
  		'data-dividertheme': 'b',
	});
	
	<!--- Secondary Nav --->
	$('##navSub ul').attr({
 		'data-role': 'listview',
  		'data-inset': 'false',
  		'data-theme': 'c',
  		'data-dividertheme': 'b'
	});
	
	$('##navSub li').attr({
 		'role': 'option',
 		'data-theme': 'c',
 		'tabindex': '0'
	});
	
	<!--- Indexes --->	
	$('.svIndex > ul').attr({
 		'data-role': 'listview',
  		'data-inset': 'true',
  		'data-theme': 'c',
  		'data-dividertheme': 'b'
	});
	
	$('.svIndex .moreResults ul').attr({
			'data-role': 'controlgroup',
			'data-type': 'horizontal',
	});
	
	$('.svIndex .moreResults ul li').attr({
			'data-role': 'button',
			'data-theme': 'c'
	});
	<!--- Forms --->
	$('form ul, form ol').attr({
			'data-role': 'fieldcontain'
	});
	
	$('form li').attr({
			'data-role': 'controlgroup'
	});
	
	$('##btn-back').live('tap',function() {
	  history.back(); return false;
	}).live('click',function() {
	  history.back(); return false;
	});
	
}	
</script>

</body>	
</html>
</cfoutput>