/* This file is part of Mura CMS. 

	Mura CMS is free software: you can redistribute it and/or modify 
	it under the terms of the GNU General Public License as published by 
	the Free Software Foundation, Version 2 of the License. 

	Mura CMS is distributed in the hope that it will be useful, 
	but WITHOUT ANY WARRANTY; without even the implied warranty of 
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the 
	GNU General Public License for more details. 

	You should have received a copy of the GNU General Public License 
	along with Mura CMS.  If not, see <http://www.gnu.org/licenses/>. 

	Linking Mura CMS statically or dynamically with other modules constitutes the preparation of a derivative work based on 
	Mura CMS. Thus, the terms and conditions of the GNU General Public License version 2 ("GPL") cover the entire combined work.
	
	However, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with programs
	or libraries that are released under the GNU Lesser General Public License version 2.1.
	
	In addition, as a special exception, the copyright holders of Mura CMS grant you permission to combine Mura CMS with 
	independent software modules (plugins, themes and bundles), and to distribute these plugins, themes and bundles without 
	Mura CMS under the license of your choice, provided that you follow these specific guidelines: 
	
	Your custom code 
	
	• Must not alter any default objects in the Mura CMS database and
	• May not alter the default display of the Mura CMS logo within Mura CMS and
	• Must not alter any files in the following directories.
	
	 /admin/
	 /tasks/
	 /config/
	 /requirements/mura/
	 /Application.cfc
	 /index.cfm
	 /MuraProxy.cfc
	
	You may copy and distribute Mura CMS with a plug-in, theme or bundle that meets the above guidelines as a combined work 
	under the terms of GPL for Mura CMS, provided that you include the source code of that other code when and as the GNU GPL 
	requires distribution of source code.
	
	For clarity, if you create a modified version of Mura CMS, you are not obligated to grant this special exception for your 
	modified version; it is your choice whether to do so, or to make such modified version available under the GNU General Public License 
	version 2 without this exception.  You may, if you choose, apply this exception to your own modified versions of Mura CMS. */var feedManager={loadSiteFilters:function(e,t,n){var r="index.cfm",i="muraAction=cFeed.loadSite&compactDisplay=true&siteid="+e+"&keywords="+t+"&isNew="+n+"&cacheid="+Math.random(),s=$("#selectFilter");s.html('<div><img class="loadProgress" src="assets/images/progress_bar.gif"></div>');$.get(r+"?"+i,function(e){$("#selectFilter").html(e)})},addContentFilter:function(e,t,n){var r=document.getElementById("contentFilters").getElementsByTagName("TBODY")[0],i=document.createElement("TR");i.id="c"+e;var s=document.createElement("TD");s.appendChild(document.createTextNode(n));s.className="var-width";var o=document.createElement("TD");o.appendChild(document.createTextNode(t));var u=document.createElement("TD");u.className="actions";var a=document.createElement("A");a.setAttribute("href","#");a.onclick=function(){$("#c"+e).remove();stripe("stripe");return!1};a.appendChild(document.createTextNode("Delete"));var f=document.createElement("UL");f.className="clearfix";var l=document.createElement("LI");l.className="delete";l.appendChild(a);f.appendChild(l);var c=document.createElement("INPUT");c.setAttribute("type","hidden");c.setAttribute("name","contentID");c.setAttribute("value",e);u.appendChild(c);u.appendChild(f);i.appendChild(s);i.appendChild(o);i.appendChild(u);r.appendChild(i);$("#noFilters").length&&$("#noFilters").hide();stripe("stripe")},removeFilter:function(e){$("#"+e).remove();stripe("stripe");return!1},loadSiteParents:function(e,t,n,r){var i="index.cfm",s="muraAction=cFeed.siteParents&compactDisplay=true&siteid="+e+"&parentid="+t+"&keywords="+n+"&isNew="+r+"&cacheid="+Math.random(),o=$("#move");o.html('<div><img class="loadProgress" src="assets/images/progress_bar.gif"><inut type=hidden name=parentid value='+t+" ></div>");$.get(i+"?"+s,function(e){$("#move").html(e)})},confirmImport:function(){$("#alertDialogMessage").html("Import Selections?");$("#alertDialog").dialog({resizable:!1,modal:!0,buttons:{YES:function(){$(this).dialog("close");submitForm(document.forms.contentForm,"Import")},NO:function(){$(this).dialog("close")}}});return!1},setDisplayListSort:function(){$("#availableListSort, #displayListSort").sortable({connectWith:".displayListSortOptions",update:function(e){e.stopPropagation();$("#displayList").val("");$("#displayListSort > li").each(function(){var e=$("#displayList").val();e!=""?$("#displayList").val(e+","+$.trim($(this).html())):$("#displayList").val($.trim($(this).html()))})}}).disableSelection()},updateInstanceObject:function(){var e={};$("#tabDisplay").find(":input").each(function(){var t=$(this);if(t.attr("type")!="radio"||t.attr("type")=="radio"&&t.is(":checked"))e[t.attr("data-displayobjectparam")]=t.val()});$("#instanceParams").val(JSON.stringify(e))}};