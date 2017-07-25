<section class="box lr-section chighlight">
	<#if icon.getSiblings()?has_content>
    <ul class="special">
        <#list icon.getSiblings() as cur_icon>
		    <li><a href="${cur_icon.link.getData()}" class="fa ${cur_icon.getData()}"></a></li>
        </#list>
	</ul>
    </#if>
	<header>
		<h2>${title.getData()}</h2>
		<p>${subtitle.getData()}</p>
	</header>
	<p>${content.getData()}</p>
</section>