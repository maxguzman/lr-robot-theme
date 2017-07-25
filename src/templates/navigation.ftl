<nav id="nav">
	<h1 class="hide-accessible"><@liferay.language key="navigation" /></h1>
	<ul>
		<#list nav_items as nav_item>
			<#assign nav_item_css_class = "" />
			<#if nav_item.isSelected()>
				<#assign nav_item_css_class = "current" />
			<#else>
				<#assign nav_item_css_class = "" />
			</#if>
			<li class="${nav_item_css_class}">
				<#if nav_item.hasChildren()>
				<a href="#">${nav_item.getName()}</a>
				<ul>
					<#list nav_item.getChildren() as nav_child>
					<li>
						<a href="${nav_child.getURL()}">${nav_child.getName()}</a>
						<#if nav_child.hasChildren()>
						<ul>
							<#list nav_child.getChildren() as nav_grchild>
							<li><a href="${nav_grchild.getURL()}">${nav_grchild.getName()}</a></li>
							</#list>
						</ul>
						</#if>
					</li>
					</#list>
				</ul>
				<#else>
					<a href="${nav_item.getURL()}">${nav_item.getName()}</a>
				</#if>
			</li>
		</#list>
	</ul>
</nav>
