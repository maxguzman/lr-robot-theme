<style type="text/css">
    .blog-entry {
     background-color: #f2f2f2;
     border-radius: 10px;
     box-shadow: 0px 1px 5px rgba(69, 69, 69, 0.5);
     margin-bottom: 40px;
    }
    
    .blog-entry header {
     padding-top: 20px;
     padding-right: 45px;
     padding-left: 45px;
     text-align: center;
    }
    
    .blog-entry header img {
     width: 150px;
     margin-bottom: 20px;
    }
    
    .circle {
     border-radius: 50%;
    }
    
    .blog-entry header h3 {
     color: #303233;
     margin-top: 0;
     margin-bottom: 10px;
    }
    
    .blog-entry header h3 a {
     color: #303233;
    }
    
    .blog-entry header hr {
     border-top-color: #303233;
     border-bottom: none;
    }
    
    .blog-entry header .meta {
     color: #303233;
    }
    
    .blog-entry .body {
     padding-right: 45px;
     padding-left: 45px;
     margin-bottom: 10px;
     color: #303233;
    }
    
    .blog-entry .btn-read-more {
     float: right;
     margin-right: 45px;
     margin-bottom: 18px;
     color: #ffffff;
     background-color: #557088;
     background-image: linear-gradient(to bottom, #557088 0%, #3d5162 100%);
     background-repeat: repeat-x;
     border-color: #3a4c5c;
    }
    
    .blog-entry footer {
     padding-right: 45px;
     padding-left: 45px;
     color: #303233;
     padding-bottom: 18px;
    }
    
    .blog-entry footer a {
     color: #303233;
    }
</style>

<#list entries as entry>
    <#if entry?is_odd_item>
    <div class="row">
    </#if>

    <#assign viewURL = renderResponse.createRenderURL() />
    ${viewURL.setWindowState("MAXIMIZED")}
    ${viewURL.setParameter("mvcRenderCommandName", "/blogs/view_entry")}
    ${viewURL.setParameter("redirect", currentURL)}
    ${viewURL.setParameter("urlTitle", entry.getUrlTitle())}

    <#assign summary = entry.getDescription() />

    <#if validator.isNull(summary)>
        <#assign summary = entry.getContent() />
    </#if>

    <div class="col-md-6 col-sm-6">
        <article class="blog-entry">
            <header>
                <#if entry.getSmallImage()>
                    <img src="${entry.getSmallImageURL(themeDisplay)}" alt="${htmlUtil.escape(entry.getTitle())}" class="circle" />
                </#if>

                <h3><a href="${viewURL}"><span>${htmlUtil.escape(entry.getTitle())}</span></a></h3>

                <time datetime="${dateUtil.getDate(entry.getCreateDate(), "yyyy-MM-dd'T'HH:mm:ssZ", locale)}" class="meta">
                ${dateUtil.getDate(entry.getCreateDate(), "dd MMM yyyy", locale)}
                </time>

                <hr />
            </header>
            <div class="body">${stringUtil.shorten(htmlUtil.stripHtml(summary), 200)}</div>
            <div class="clearfix">
                <a href="${viewURL}" class="btn btn-read-more"><@liferay.language key="read-more" /></a>
            </div>

            <footer>
                    <#assign blogsEntryClassName = "com.liferay.blogs.kernel.model.BlogsEntry" />

                    <span class="entry-categories">
                        <@liferay_ui["asset-categories-summary"]
                        className=blogsEntryClassName
                        classPK=entry.getEntryId()
                        portletURL=renderResponse.createRenderURL()
                        />
                    </span>

                    <span class="entry-tags">
                        <@liferay_ui["asset-tags-summary"]
                        className=blogsEntryClassName
                        classPK=entry.getEntryId()
                        portletURL=renderResponse.createRenderURL()
                        />
                    </span>
            </footer>

        </article>
    </div>

    <#if entry?is_even_item || !entry?has_next>
    </div>
    </#if>
</#list>