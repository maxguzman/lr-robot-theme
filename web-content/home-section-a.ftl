<section class="box features lr-section">
	<h2 class="major"><span>${Title.getData()}</span></h2>
	<div>
		<div class="row">
			<#if Header.getSiblings()?has_content>
	           <#list Header.getSiblings() as cur_Header>
	           <div class="3u 12u(mobile)">
	           <!-- Feature -->
	                <section class="box feature">
		                <a href="${cur_Header.Link.getFriendlyUrl()}" class="image featured"><img src="${cur_Header.Imagecwrj.getData()}"/></a>
					    <h3><a href="${cur_Header.Link.getFriendlyUrl()}">${cur_Header.getData()}</a></h3>
				    	<p>${cur_Header.Body.getData()}</p>
			    	</section>
			    </div>
	           </#list>
            </#if>
        </div>
	
	    <div class="row">
			<div class="12u">
				<ul class="actions">
					<li><a href="${okButtonLabel.okButtonLink.getFriendlyUrl()}" class="button big">${okButtonLabel.getData()}</a></li>
					<li><a href="${noButtonLabel.noButtonLink.getFriendlyUrl()}" class="button alt big">${noButtonLabel.getData()}</a></li>
				</ul>
			</div>
		</div>
	
	</div>
</section>