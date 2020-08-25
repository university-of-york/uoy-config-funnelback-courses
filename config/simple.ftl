<#ftl encoding="utf-8" />
<#import "/web/templates/modernui/funnelback_classic.ftl" as s/>
<#import "/web/templates/modernui/funnelback.ftl" as fb/>
<#import "/conf/york-uni-web/workflow/additional_macros.ftl" as am/>
<#import "/conf/york-uni-web/_default_preview/result.ftl" as Result/>
<#escape x as x?html>
<#--
  Sets HTML encoding as the default for this file only - use <#noescape>...</#noescape> around anything which should not be escaped.
  Note that if you include macros from another file, they are not affected by this and must hand escaping themselves
  Either by using a similar escape block, or ?html escapes inline.
-->
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="author" content="University of York">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="robots" content="noindex">
  <!-- https://york.funnelback.co.uk/search/admin/edit-form.cgi?collection=york-uni-web&f=simple.ftl&dir=profile-folder-_default_preview&profile=_default_preview -->

  <@s.OpenSearch />
  <@s.AfterSearchOnly><link rel="alternate" type="application/rss+xml" title="Search results for ${question.inputParameterMap["query"]!}<@s.IfDefCGI name="query">,&nbsp;</@s.IfDefCGI><@s.cfg>service_name</@s.cfg>" href="?collection=<@s.cfg>collection</@s.cfg>&amp;query=${question.inputParameterMap["query"]!?url}&amp;form=rss&amp;sort=date"></@s.AfterSearchOnly>

  <title><@s.AfterSearchOnly>Search results for ${question.inputParameterMap["query"]!}<@s.IfDefCGI name="query">,&nbsp;</@s.IfDefCGI></@s.AfterSearchOnly>University of York</title>

  <!-- Description meta -->
  <meta name="description" content="<@s.AfterSearchOnly>Search results for ${question.inputParameterMap["query"]!}<@s.IfDefCGI name="query">,&nbsp;</@s.IfDefCGI></@s.AfterSearchOnly>" />

  <!-- Keywords meta -->
  <meta name="keywords" content="york, yorkshire, uk, united kingdom, university, university of york, student, recruitment, admissions, study, prospectus" />

  <!-- Head end + header -->
  <link rel="search" type="application/opensearchdescription+xml" title="University of York" href="https://www.york.ac.uk/static/stable/opensearch.xml">
  <link rel="shortcut icon" href="https://www.york.ac.uk/static/stable/img/favicon.ico">
  <link rel="icon" type="image/x-icon" href="https://www.york.ac.uk/static/stable/img/favicon.ico">

  <link rel="stylesheet" href="https://www.york.ac.uk/static/stable/css/styles.min.css" media="screen">

  <script src="https://www.york.ac.uk/static/stable/js/modernizr.min.js"></script>
  <script src="https://www.york.ac.uk/static/stable/js/app.min.js"></script>

  <!-- Typekit script -->
  <link rel="stylesheet" href="https://use.typekit.net/dvj8rpp.css">
  
  <!-- Print styles -->
  <link rel="stylesheet" href="https://www.york.ac.uk/static/stable/css/print.min.css" media="print">

    <!-- Hacks -->
    <script>
    $(function() {
        var leadingSpaces = $(".c-listings-item__description");
        if(leadingSpaces.length > 0) {
          leadingSpaces.each(function() {
            var $this = $(this);
        
            if($this.text().trim().indexOf(". ") == 0) {
              $this.html($this.html().trim().replace(/^&nbsp;\. /, ""));
            }
          });
        }
        });
    </script>
</head>

<body>

<!-- Google Tag Manager -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-WXLX54" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src='//www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);})(window,document,'script','dataLayer','GTM-WXLX54');</script>


<a href="#Main-Content" class="o-skip-link">Skip to content</a>

<header class="c-main-header" role="banner">
  <div class="o-wrapper o-grid">
    <div class="o-grid__row">
      <div class="o-grid__box o-grid__box--threequarters o-grid__box--threequarters@medium o-grid__box--threequarters@small o-grid__box--threequarters@tiny">
        <h2 class="c-main-header__title"><a href="http://www.york.ac.uk/"><img class="c-main-header__logo" src="https://www.york.ac.uk/static/1.5/img/logo.svg" alt="University of York" width="250" height="40"></a></h2>
      </div>
      <div class="o-grid__box o-grid__box--quarter o-grid__box--quarter@medium o-grid__box--quarter@small o-grid__box--quarter@tiny">
        <form action="https://www.york.ac.uk/search" method="get" class="c-form c-form--joined c-form--header is-hidden@medium-">
          <fieldset>
            <div class="c-form__element">
              <input class="c-form__input c-form__input--text" type="text" id="q" name="q" placeholder="Search york.ac.uk" />
              <input type="hidden" name="site" value="yorkweb">
              <button type="submit" class="c-btn c-btn--medium" aria-label="Search"><i class="c-icon c-icon--search" aria-hidden="true"></i></button>
            </div>
          </fieldset>
        </form>
        <!-- Mobile search -->
        <a href="#Mobile-Search" class="c-mobile-search-button js-toggle-button is-hidden@large+"><i class="c-icon c-icon--search"></i></a>
      </div>
    </div>
  </div>
</header>

<!-- Mobile search -->
<form action="https://www.york.ac.uk/search" method="get" class="c-form c-form--joined c-form--mobile-search" id="Mobile-Search">
  <fieldset class="c-form__fieldset">
    <legend class="c-form__legend">Search york.ac.uk</legend>
    <div class="o-grid">
      <div class="o-grid__row">
        <div class="o-grid__box o-grid__box--full">
          <div class="c-form__element">
            <input class="c-form__input c-form__input--text" type="text" id="q-mobile" name="q" />
            <input type="hidden" name="site" value="yorkweb">
            <button type="submit" class="c-btn c-btn--medium" aria-label="Search">Search</button>
          </div>
        </div>
      </div>
    </div>
  </fieldset>
</form>

<!-- Page title -->
<div class="o-wrapper o-wrapper--wide c-page-title__wrapper c-page-title__wrapper--bordered o-grid">
  <div class="o-grid__row">
    <div class="o-grid__box o-grid__box--full">
      <div class="c-page-title">
        <h1 class="c-page-title__header"><a class="c-page-title__link" href="">Search results</a></h1>
      </div>
    </div>
  </div>
</div>

<div id="Main-Content" class="o-wrapper o-wrapper--main o-grid js-wrapper--main">
  <div class="o-grid__row">
    <div class="o-grid__box o-grid__box--threequarters">

    <!-- SEARCH HEADER -->
      <@s.InitialFormOnly>
      <form class="c-form c-form--joined" action="${question.collection.configuration.value("ui.modern.search_link")}" method="get" role="search">
        <input class="c-form__input c-form__input--hidden" type="hidden" name="collection" value="${question.inputParameterMap["collection"]!}">
        <@s.IfDefCGI name="enc">
        <input class="c-form__input c-form__input--hidden" type="hidden" name="enc" value="${question.inputParameterMap["enc"]!}">
        </@s.IfDefCGI>
        <@s.IfDefCGI name="form">
          <input class="c-form__input c-form__input--hidden" type="hidden" name="form" value="${question.inputParameterMap["form"]!}">
        </@s.IfDefCGI>
        <@s.IfDefCGI name="scope">
          <input class="c-form__input c-form__input--hidden" type="hidden" name="scope" value="${question.inputParameterMap["scope"]!}">
        </@s.IfDefCGI>
        <@s.IfDefCGI name="lang">
          <input class="c-form__input c-form__input--hidden" type="hidden" name="lang" value="${question.inputParameterMap["lang"]!}">
        </@s.IfDefCGI>
        <@s.IfDefCGI name="profile">
          <input class="c-form__input c-form__input--hidden" type="hidden" name="profile" value="${question.inputParameterMap["profile"]!}">
        </@s.IfDefCGI>
        <div class="c-form__element">
          <input required name="query" size="50" id="query" title="Search query" type="text" value="${question.inputParameterMap["query"]!}" accesskey="q" placeholder="Search the University website&hellip;" class="c-form__input c-form__input--text" data-ng-disabled="isDisplayed('cart') || isDisplayed('history')">
          <button class="c-btn c-btn--medium" type="submit" aria-label="Search">Search<i class="c-icon c-icon--search c-icon--after"></i></button>
        </div>
      </form>
      </@s.InitialFormOnly>

      <@s.AfterSearchOnly>
      <!--<p class="lead">Looking for research? <a href="https://pure.york.ac.uk/portal/en/searchall.html?searchall=${question.inputParameterMap["query"]!}">Try your search in the York Research Database</a></p>-->

      <form class="c-form c-form--joined" action="${question.collection.configuration.value("ui.modern.search_link")}" method="get" role="search">
          <input class="c-form__input c-form__input--hidden" type="hidden" name="collection" value="${question.inputParameterMap["collection"]!}">

        <@s.IfDefCGI name="enc">
          <input class="c-form__input c-form__input--hidden" type="hidden" name="enc" value="${question.inputParameterMap["enc"]!}">
        </@s.IfDefCGI>
        <@s.IfDefCGI name="form">
          <input class="c-form__input c-form__input--hidden" type="hidden" name="form" value="${question.inputParameterMap["form"]!}">
        </@s.IfDefCGI>
        <@s.IfDefCGI name="scope">
          <input class="c-form__input c-form__input--hidden" type="hidden" name="scope" value="${question.inputParameterMap["scope"]!}">
        </@s.IfDefCGI>
        <@s.IfDefCGI name="lang">
          <input class="c-form__input c-form__input--hidden" type="hidden" name="lang" value="${question.inputParameterMap["lang"]!}">
        </@s.IfDefCGI>
        <@s.IfDefCGI name="profile">
          <input class="c-form__input c-form__input--hidden" type="hidden" name="profile" value="${question.inputParameterMap["profile"]!}">
        </@s.IfDefCGI>
        <@s.IfDefCGI name="site">
          <input type="hidden" name="site" value="${question.inputParameterMap["site"]!}">
        </@s.IfDefCGI>
        <div class="c-form__element">
          <input required name="query" size="50" id="query" title="Search query" type="text" value="${question.inputParameterMap["query"]!}" accesskey="q" placeholder="Search the University website&hellip;" class="c-form__input c-form__input--text" data-ng-disabled="isDisplayed('cart') || isDisplayed('history')">
          <button class="c-btn c-btn--medium" type="submit" aria-label="Search">Search<i class="c-icon c-icon--search c-icon--after"></i></button>
        </div>
      </form>

      <p>
      <#if response.resultPacket.resultsSummary.totalMatching == 0>
        <span id="search-total-matching">0</span> search results for <strong><@s.QueryClean /></strong>.
      </#if>
      <#if response.resultPacket.resultsSummary.totalMatching != 0>
        <span id="search-page-start">${response.resultPacket.resultsSummary.currStart}</span> -
        <span id="search-page-end">${response.resultPacket.resultsSummary.currEnd}</span> of
        <span id="search-total-matching">${response.resultPacket.resultsSummary.totalMatching?string.number}</span>
        <#if question.inputParameterMap["s"]?? && question.inputParameterMap["s"]?contains("?:")><em>collapsed</em> </#if>search results for <strong><@s.QueryClean></@s.QueryClean></strong>.
      </#if>
      <br class="is-visible@small-">
      <a href="https://pure.york.ac.uk/portal/en/searchall.html?searchall=${question.inputParameterMap["query"]!}">Try your search in the York Research Database</a>
      </p>

      <#if (response.resultPacket.QSups)!?size &gt; 0>
      <p><@fb.CheckBlending linkText="Search for <em>"+question.originalQuery+"</em> instead." tag="strong" /></p>
      </#if>

      <@s.CheckSpelling prefix="<p id=\"search-spelling\"><span class=\"glyphicon glyphicon-question-sign text-muted\"></span> Did you mean <em>" suffix="</em>?</p>" />

      <#if question.inputParameterMap["scope"]?? && question.inputParameterMap["scope"]!="www.york.ac.uk">
      <p>Not seeing the results you hoped for? <a href="${question.collection.configuration.value("ui.modern.search_link")}?collection=${question.inputParameterMap["collection"]!}&site=yorkweb&query=${question.inputParameterMap["query"]!}">Try broadening your search to the whole website</a></p>
      </#if>
    <!-- END SEARCH HEADER -->

    </div>
  </div>

  <div class="o-grid__row">
  <!-- Note: id/search-results MUST be left intact as monitoring service depends on this -->
    <div id="search-results" class="o-grid__box o-grid__box--threequarters" data-ng-show="isDisplayed('results')">

      <div id="search-result-count" class="text-muted">
      <#assign curatorAdvertPresent = false />
        <#list response.curator.exhibits as exhibit>
            <#if exhibit.titleHtml?? && exhibit.linkUrl??>
                <#assign curatorAdvertPresent = true />
                <#break>
            </#if>
        </#list>

        <#if (response.resultPacket.bestBets)!?size &gt; 0 || curatorAdvertPresent >
        <div id="search-best-bets" class="list-unstyled c-listings">
        <#-- Curator exhibits -->
        <#list response.curator.exhibits as exhibit>
        <#if exhibit.titleHtml?? && exhibit.linkUrl??>
            <div class="c-listings-item c-listings-item--highlighted" role="alert">
                <a class="c-listings-item__link" href="${exhibit.linkUrl}">
                    <h2 class="c-listings-item__title"><span class="l"><@s.boldicize><#noescape>${exhibit.titleHtml}</#noescape></@s.boldicize></span></h2>
                    <#if exhibit.descriptionHtml??><div class="c-listings-item__description"><p><@s.boldicize><#noescape>${exhibit.descriptionHtml}</#noescape></@s.boldicize></p></div></#if>
                    <#if exhibit.displayUrl??> <p class="c-listings-item__url">${exhibit.displayUrl}</p></#if>
                </a>
            </div>
        </#if>
        </#list>
        <#-- Old-style best bets -->
        <@s.BestBets>
        <div class="c-listings-item c-listings-item--highlighted" role="alert">
            <#if s.bb.title??><a class="c-listings-item__link" href="${s.bb.clickTrackingUrl}">
                <h2 class="c-listings-item__title"><span class="l"><@s.boldicize>${s.bb.title}</@s.boldicize></span></h2>
                <div class="c-listings-item__description">
                    <#if s.bb.description??>
                        <#if s.bb.description == "<br>">
                            <p></p> 
                        <#else>
                            <@s.boldicize><#noescape>${s.bb.description}</#noescape></@s.boldicize>
                        </#if>
                    <#else>
                        <p></p>
                    </#if>
                </div>
              <p class="c-listings-item__url">
              <#if s.bb.link?starts_with("https://www.")>
                ${s.bb.link?replace("https://www.", "")?ensure_ends_with("/")?keep_before_last("/")}
               <#elseif s.bb.link?starts_with("http://www.")>
                ${s.bb.link?replace("http://www.", "")?ensure_ends_with("/")?keep_before_last("/")}
              <#elseif s.bb.link?starts_with("https://")>
                ${s.bb.link?replace("https://", "")?ensure_ends_with("/")?keep_before_last("/")}
               <#elseif s.bb.link?starts_with("http://")>
                ${s.bb.link?replace("http://", "")?ensure_ends_with("/")?keep_before_last("/")}
              </#if>
              </p>
            </a></#if>
        </div>
        </@s.BestBets>
       </div>
       </#if>

        <ul class="c-listings">
          <@s.Results>
            <#if s.result.class.simpleName == "TierBar">
            <#else>

              <li class="c-listings-item" data-fb-result=${s.result.indexUrl}>

                <@Result.ResultRoute />

              </li>

            </#if>
          </@s.Results>
        </ul>

        <#if response.resultPacket.resultsSummary.totalMatching &gt; 10>
        <div class="c-pagination">
          <ul class="c-pagination__list">
            <!--<li>Result page:</li>-->
            
            <@fb.Prev>
            <li class="c-pagination__item c-pagination__item--type-nav">
                <a href="${fb.prevUrl}" rel="prev" class="c-pagination__page c-pagination__page--previous">
                    <i class="c-icon c-icon--chevron-left c-icon--before"></i><span class="is-hidden@small-">Previous</span>
                </a>
            </li>
            </@fb.Prev>
            
            <#assign firstPageURL = "?" + changeParam(QueryString, "start_rank", 1)>
            <#assign numOfPages = 7>

            <#if response.resultPacket.resultsSummary.currStart &gt; 40>
            
                <#assign numOfPages = 5>
            
                <li class="c-pagination__item c-pagination__item--type-numeral">
                    <a href="${firstPageURL}" class="c-pagination__page">1</a>
                </li>
                <li class="c-pagination__item c-pagination__item--type-numeral">
                    <a class="c-pagination__page c-pagination__page--type-break">...</a>
                </li>
            </#if>

            <#assign counter = 0 >
            <@fb.Page numPages = numOfPages>
                <#assign counter = counter + 1 >
                <li class="c-pagination__item c-pagination__item--type-numeral<#if response.resultPacket.resultsSummary.currStart &gt; 40 && ( counter == 1 || counter == numOfPages )> is-hidden@small-</#if>">
                    <a href="${fb.pageUrl}" class="c-pagination__page<#if fb.pageCurrent> c-pagination__page--current</#if>">${fb.pageNumber}</a>
                </li>
            </@fb.Page>
            
            <@fb.Next>
            <li class="c-pagination__item c-pagination__item--type-nav">
                <a href="${fb.nextUrl}" rel="next" class="c-pagination__page c-pagination__page--next">
                    <span class="is-hidden@small-">Next</span><i class="c-icon c-icon--chevron-right c-icon--after"></i>
                </a>
            </li>
            </@fb.Next>
          </ul>
        </div>
        </#if>

      </div>

    </@s.AfterSearchOnly>

    </div>

    <div class="o-grid__box o-grid__box--quarter">
    </div>

  </div>

</div>

<footer class="c-footer-main" role="contentinfo">
  <div class="o-grid o-wrapper">
    <div class="o-grid__row">
      <div class="o-grid__box o-grid__box--quarter o-grid__box--half@small o-grid__box--full@tiny">
        <h3 class="c-footer-main__heading">Information for</h3>
        <ul>
          <li><a href="http://www.york.ac.uk/study/">Prospective students</a></li>
          <li><a href="https://www.york.ac.uk/students/">Current students</a></li>
          <li><a href="https://www.york.ac.uk/staff/">Staff</a></li>
          <li><a href="http://www.yorkspace.net/">Alumni</a></li>
          <li><a href="http://www.york.ac.uk/news-and-events/for-media/">Press and media</a></li>
        </ul>
      </div>
      <div class="o-grid__box o-grid__box--quarter o-grid__box--half@small o-grid__box--full@tiny">
        <h3 class="c-footer-main__heading">About</h3>
        <ul>
          <li><a href="http://www.york.ac.uk/about/">About the University</a></li>
          <li><a href="http://www.york.ac.uk/research/">Research</a></li>
          <li><a href="http://www.york.ac.uk/business/">Business</a></li>
          <li><a href="http://www.york.ac.uk/global">Global</a></li>
          <li><a href="http://www.york.ac.uk/news-and-events/news/">News</a></li>
          <li><a href="http://www.york.ac.uk/news-and-events/events/">Events</a></li>
        </ul>
      </div>
      <div class="o-grid__box o-grid__box--quarter o-grid__box--half@small o-grid__box--full@tiny">
        <h3 class="c-footer-main__heading">Quick links</h3>
        <ul>
          <li><a href="http://www.york.ac.uk/about/departments/a-to-z/">A-Z</a></li>
          <li><a href="http://www.york.ac.uk/about/departments/">Departments</a></li>
          <li><a href="https://www.york.ac.uk/directory/">Staff directory</a></li>
          <li><a href="http://www.york.ac.uk/about/maps/">Maps and directions</a></li>
          <li><a href="http://www.york.ac.uk/about/term-dates/">Term dates</a></li>
          <li><a href="http://jobs.york.ac.uk/">Job vacancies</a></li>
        </ul>
      </div>
      <div class="o-grid__box o-grid__box--quarter o-grid__box--half@small o-grid__box--full@tiny">
        <h3 class="c-footer-main__heading">Contact us</h3>
        <p class="c-footer-main__address">University of York<br>
          York<br>
          YO10 5DD<br>
          United Kingdom<br>
        </p>
        <p>+44 (0) 1904 320 000</p>
      </div>
    </div>
    <div class="o-grid__row">
      <div class="o-grid__box o-grid__box--quarter">
        <p>
          <a href="https://twitter.com/uniofyork" aria-label="Follow us on Twitter"><i class="c-icon c-icon--twitter c-icon--2x c-icon--fw" title="Follow us on Twitter" aria-hidden="true"></i></a>
          <a  href="https://www.facebook.com/universityofyork" aria-label="Like us on Facebook"><i class="c-icon c-icon--facebook c-icon--2x c-icon--fw" title="Like us on Facebook" aria-hidden="true"></i></a>
          <a href="https://instagram.com/uniofyork" aria-label="Follow us on Instagramr"><i class="c-icon c-icon--instagram c-icon--2x  c-icon--fw" title="Follow us on Instagram" aria-hidden="true"></i></a>
          <a  href="http://www.youtube.com/universityofyorkuk" aria-label="Watch our videos on YouTube"><i class="c-icon c-icon--youtube c-icon--2x c-icon--fw" title="Watch our videos on YouTube" aria-hidden="true"></i></a>
        </p>
      </div>
      <div class="o-grid__box o-grid__box--half">
        <p>&copy; University of York <br /> <a href="http://www.york.ac.uk/about/legal-statements/">Legal statements</a> | <a href="http://www.york.ac.uk/about/legal-statements/#tab-5">Privacy and cookies</a></p>
      </div>
      <div class="o-grid__box o-grid__box--quarter"><!-- Footer start-->
<p><a class="t4Edit-page" href="https://cms.york.ac.uk/terminalfour/SiteManager?ctfn=content&amp;fnno=30&amp;sid=45605">Modify</a></p>
      </div>
    </div>
  </div>
</footer>

</body>

</html>
</#escape>
