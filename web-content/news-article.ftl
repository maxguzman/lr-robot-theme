<#assign renderUrlMax = request["render-url-maximized"]>
<#assign namespace = request["portlet-namespace"]>
<#assign readmore = request.parameters?is_hash && request.parameters.read_more?? && getterUtil.getBoolean(request.parameters.read_more?first, false)>
<h1>${title.getData()}</h1>
<#if readmore>
<p>${abstract.getData()}</p>
<p>${body.getData()}</p>
<#else>
<p>
<img src="${image.getData()}" border="0" align="right">
${abstract.getData()}</p>
<a href="${renderUrlMax}&${namespace}read_more=true">Read More</a>
</#if>

<@liferay_portlet["runtime"] portletName="com_liferay_login_web_portlet_LoginPortlet" />