<#ftl output_format="HTML" encoding="utf-8" />
<#import "/web/templates/modernui/funnelback_classic.ftl" as s/>
<#import "/web/templates/modernui/funnelback.ftl" as fb/>

<!DOCTYPE html>
<html lang="en-us">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="robots" content="nofollow">
    <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

    <@s.OpenSearch />
    <@s.AfterSearchOnly><link rel="alternate" type="application/rss+xml" title="Search results for ${question.inputParameterMap["query"]!}<@s.IfDefCGI name="query">,&nbsp;</@s.IfDefCGI><@s.cfg>service_name</@s.cfg>" href="?collection=<@s.cfg>collection</@s.cfg>&amp;query=${question.inputParameterMap["query"]!?url}&amp;form=rss&amp;sort=date"></@s.AfterSearchOnly>

    <title><@s.AfterSearchOnly>${question.inputParameterMap["query"]!}<@s.IfDefCGI name="query">,&nbsp;</@s.IfDefCGI></@s.AfterSearchOnly><@s.cfg>service_name</@s.cfg>, Funnelback Search</title>

    <link rel="stylesheet" href="${GlobalResourcesPrefix}thirdparty/bootstrap-3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${GlobalResourcesPrefix}css/funnelback.faceted-navigation-1.0.0.css" />

    <#if question.collection.configuration.value('auto-completion') == 'enabled'>
        <link rel="stylesheet" type="text/css" href="${GlobalResourcesPrefix}css/funnelback.autocompletion-2.6.0.css" />
    </#if>

    <style>
        .search-initial { padding: 40px 15px; }
        .form-control-inline { color:#555; background-color:#fff; background-image:none; border:1px solid #ccc; border-radius:4px; -webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075); box-shadow:inset 0 1px 1px rgba(0,0,0,.075); -webkit-transition:border-color ease-in-out .15s,-webkit-box-shadow ease-in-out .15s; -o-transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s; transition:border-color ease-in-out .15s,box-shadow ease-in-out .15s; }
        #search-result-count { margin-bottom: 10px; }
        #search-results .result { margin-bottom: 24px; }
        #search-results li h4, #search-best-bets h4 { margin-top: 0; margin-bottom: 0; }
        .search-collapsed { text-indent: 8px; }
        .search-metrics td div.metric { border: solid 1px #ddd; }

        svg line, svg rect { stroke: #777; }
        svg rect.query   { fill: #f2dede; }
        svg rect.literal { fill: #dff0d8; }
        svg rect.logical { fill: #fcf8e3; }
        svg rect.set     { fill: #d9edf7; }
    </style>

    <script src="${GlobalResourcesPrefix}thirdparty/jquery-3.3.1/jquery.min.js"></script>

    <!--[if lt IE 9]>
    <script src="${GlobalResourcesPrefix}thirdparty/html5shiv.js"></script>
    <script src="${GlobalResourcesPrefix}thirdparty/respond.min.js"></script>
  <![endif]-->

    <!-- Template uses <a href="http://getbootstrap.com/">Bootstrap</a> and <a href="http://glyphicons.getbootstrap.com/">Glyphicons</a> -->
</head>
<body>
<div class="container">
    <@fb.ViewModeBanner />

    <@s.InitialFormOnly>
        <div class="row search-initial">
            <div class="col-md-6 col-md-offset-3 text-center">

                <#if error?? || (response.resultPacket.error)??>
                    <div class="alert alert-danger"><@fb.ErrorMessage /></div>
                    <br><br>
                </#if>

                <a href="http://funnelback.com/"><img src="${GlobalResourcesPrefix}funnelback.png" alt="Funnelback logo"></a>
                <br><br>

                <form action="${question.collection.configuration.value("ui.modern.search_link")}" method="GET">
                    <input type="hidden" name="collection" value="${question.inputParameterMap["collection"]!}">
                    <@s.IfDefCGI name="enc"><input type="hidden" name="enc" value="${question.inputParameterMap["enc"]!}"></@s.IfDefCGI>
                    <@s.IfDefCGI name="form"><input type="hidden" name="form" value="${question.inputParameterMap["form"]!}"></@s.IfDefCGI>
                    <@s.IfDefCGI name="scope"><input type="hidden" name="scope" value="${question.inputParameterMap["scope"]!}"></@s.IfDefCGI>
                    <@s.IfDefCGI name="lang"><input type="hidden" name="lang" value="${question.inputParameterMap["lang"]!}"></@s.IfDefCGI>
                    <@s.IfDefCGI name="profile"><input type="hidden" name="profile" value="${question.inputParameterMap["profile"]!}"></@s.IfDefCGI>
                    <div class="input-group">
                        <input required name="query" id="query" title="Search query" type="text" value="${question.inputParameterMap["query"]!}" accesskey="q" placeholder="Search <@s.cfg>service_name</@s.cfg>&hellip;" class="form-control input-lg query">
                        <div class="input-group-btn">
                            <button type="submit" class="btn btn-primary input-lg"><span class="glyphicon glyphicon-search"></span> Search</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </@s.InitialFormOnly>

    <@s.AfterSearchOnly>
    <nav class="navbar navbar-default">
        <h1 class="sr-only">Search</h1>
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="${GlobalResourcesPrefix}images/funnelback-logo-small.png" alt="Funnelback" style="height: 17px;"></a>
        </div>

        <div class="collapse navbar-collapse">
            <form class="navbar-form navbar-left form-inline" action="${question.collection.configuration.value("ui.modern.search_link")}" method="GET">
                <input type="hidden" name="collection" value="${question.inputParameterMap["collection"]!}">
                <@s.IfDefCGI name="enc"><input type="hidden" name="enc" value="${question.inputParameterMap["enc"]!}"></@s.IfDefCGI>
                <@s.IfDefCGI name="form"><input type="hidden" name="form" value="${question.inputParameterMap["form"]!}"></@s.IfDefCGI>
                <@s.IfDefCGI name="scope"><input type="hidden" name="scope" value="${question.inputParameterMap["scope"]!}"></@s.IfDefCGI>
                <@s.IfDefCGI name="lang"><input type="hidden" name="lang" value="${question.inputParameterMap["lang"]!}"></@s.IfDefCGI>
                <@s.IfDefCGI name="profile"><input type="hidden" name="profile" value="${question.inputParameterMap["profile"]!}"></@s.IfDefCGI>
                <div class="form-group">
                    <input required name="query" id="query" title="Search query" type="text" value="${question.inputParameterMap["query"]!}" accesskey="q" placeholder="Search <@s.cfg>service_name</@s.cfg>&hellip;" class="form-control query">
                </div>
                <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span> Search</button>
                <div class="checkbox-inline">
                    <@s.FacetScope> Within selected categories only</@s.FacetScope>
                </div>
            </form>

            <ul class="nav navbar-nav navbar-right">
                <#if question.collection.configuration.valueAsBoolean("ui.modern.session")>
                    <li class="flb-cart-count"></li>
                </#if>
                <li class="dropdown">
                    <a href="#" title="Advanced Settings" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-cog"></span> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a data-toggle="collapse" href="#search-advanced" title="Advanced search">Advanced search</a></li>
                        <#if question.collection.configuration.valueAsBoolean("ui.modern.session")><li><a class="session-history-toggle">History</a></li></#if>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" title="Tools" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-question-sign"></span> <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a data-toggle="modal" href="#search-performance" title="Performance report">Performance</a></li>
                        <li><a data-toggle="modal" href="#search-syntaxtree" title="Query syntax tree">Query syntax tree</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <div class="well collapse  <@s.IfDefCGI name="from-advanced">in</@s.IfDefCGI>" id="search-advanced">
        <div class="row">
            <div class="col-md-12">
                <form action="${question.collection.configuration.value("ui.modern.search_link")}" method="GET" class="form-horizontal">
                    <input type="hidden" name="collection" value="${question.inputParameterMap["collection"]!}">
                    <input type="hidden" name="from-advanced" value="true">
                    <input type="hidden" name="facetScope" value="<@s.FacetScope input=false />">
                    <@s.IfDefCGI name="enc"><input type="hidden" name="enc" value="${question.inputParameterMap["enc"]!}"></@s.IfDefCGI>
                    <@s.IfDefCGI name="form"><input type="hidden" name="form" value="${question.inputParameterMap["form"]!}"></@s.IfDefCGI>
                    <@s.IfDefCGI name="scope"><input type="hidden" name="scope" value="${question.inputParameterMap["scope"]!}"></@s.IfDefCGI>
                    <@s.IfDefCGI name="profile"><input type="hidden" name="profile" value="${question.inputParameterMap["profile"]!}"></@s.IfDefCGI>

                    <div class="row">
                        <div class="col-md-4">
                            <fieldset>
                                <legend>Contents</legend>
                                <div class="form-group">
                                    <label class="col-md-4 control-label" for="query-advanced">Any</label>
                                    <div class="col-md-8">
                                        <input type="text" id="query-advanced" name="query" value="${question.inputParameterMap["query"]!}" class="form-control input-sm" placeholder="e.g. juliet where thou love">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="query_and" class="col-md-4 control-label">All</label>
                                    <div class="col-md-8">
                                        <input type="text" id="query_and" name="query_and" value="${question.inputParameterMap["query_and"]!}" class="form-control input-sm" placeholder="e.g. juliet where thou love">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="query_phrase" class="col-md-4 control-label">Phrase</label>
                                    <div class="col-md-8">
                                        <input type="text" id="query_phrase" name="query_phrase" value="${question.inputParameterMap["query_phrase"]!}" class="form-control input-sm" placeholder="e.g. to be or not to be">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="query_not" class="col-md-4 control-label">Not</label>
                                    <div class="col-md-8">
                                        <input type="text" id="query_not" name="query_not" value="${question.inputParameterMap["query_not"]!}" class="form-control input-sm" placeholder="e.g. brutus othello">
                                    </div>
                                </div>
                            </fieldset>
                        </div>

                        <div class="col-md-4">
                            <fieldset>
                                <legend>Metadata</legend>
                                <div class="form-group">
                                    <label for="meta_t" class="col-md-4 control-label">Title</label>
                                    <div class="col-md-8">
                                        <input type="text" id="meta_t" name="meta_t" placeholder="e.g. A Midsummer Night's Dream" value="${question.inputParameterMap["meta_t"]!}" class="form-control input-sm">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="meta_author" class="col-md-4 control-label">Author</label>
                                    <div class="col-md-8">
                                        <input type="text" id="meta_author" name="meta_author" placeholder="e.g. William Shakespeare" value="${question.inputParameterMap["meta_author"]!}" class="form-control input-sm">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="meta_keyword" class="col-md-4 control-label">Subject</label>
                                    <div class="col-md-8">
                                        <input type="text" id="meta_keyword" name="meta_keyword" placeholder="e.g. comedy" value="${question.inputParameterMap["meta_keyword"]!}" class="form-control input-sm">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4" for="meta_f_sand">Format</label>
                                    <div class="col-md-8">
                                        <@s.Select name="meta_f_sand" id="meta_f_sand" options=["=Any ", "pdf=PDF  (.pdf) ", "xls=Excel (.xls) ", "ppt=Powerpoint (.ppt) ", "rtf=Rich Text (.rtf) ", "doc=Word (.doc) ", "docx=Word 2007+ (.docx) "] class="form-control input-sm"/>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <div class="col-md-4">
                            <fieldset>
                                <legend>Published</legend>
                                <div class="form-group">
                                    <label class="control-label col-md-4">After</label>
                                    <label class="sr-only" for="meta_d1year">Year</label>
                                    <@s.Select id="meta_d1year" name="meta_d1year" id="meta_d1year" options=["=Year"] range="CURRENT_YEAR - 20..CURRENT_YEAR" class="form-control-inline input-sm" />
                                    <label class="sr-only" for="meta_d1month">Month</label>
                                    <@s.Select id="meta_d1month" name="meta_d1month" options=["=Month", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"] class="input-sm form-control-inline" />
                                    <label class="sr-only" for="meta_d1day">Day</label>
                                    <@s.Select id="meta_d1day" name="meta_d1day" options=["=Day"] range="1..31" class="input-sm form-control-inline"/>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4">Before</label>
                                    <label class="sr-only" for="meta_d2year">Year</label>
                                    <@s.Select id="meta_d2year" name="meta_d2year"  options=["=Year"] range="CURRENT_YEAR - 20..CURRENT_YEAR + 1" class="input-sm form-control-inline" />
                                    <label class="sr-only" for="meta_d2month">Month</label>
                                    <@s.Select id="meta_d2month" name="meta_d2month" options=["=Month", "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"] class="input-sm form-control-inline" />
                                    <label class="sr-only" for="meta_d2day">Day</label>
                                    <@s.Select id="meta_d2day" name="meta_d2day" options=["=Day"] range="1..31" class="input-sm form-control-inline" />
                                </div>
                            </fieldset>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-4">
                            <fieldset>
                                <legend>Display</legend>

                                <div class="form-group">
                                    <label class="control-label col-md-4" for="sort">Sort</label>
                                    <div class="col-md-8">
                                        <@s.Select id="sort" name="sort" class="form-control" options=["=Relevance ", "date=Date (Newest first)", "adate=Date (Oldest first)", "title=Title (A-Z)", "dtitle=Title (Z-A)", "prox=Distance" "url=URL (A-Z)", "durl=URL (Z-A)", "shuffle=Shuffle"] />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4" for="num_ranks">Results</label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="number" min="1" id="num_ranks" name="num_ranks" placeholder="e.g. 10" value="${question.inputParameterMap["num_ranks"]!10}" class="form-control input-sm">
                                            <span class="input-group-addon">per page</span>
                                        </div>
                                    </div>
                                </div>
                            </fieldset>
                        </div>

                        <div class="col-md-4">
                            <fieldset>
                                <legend>Located</legend>
                                <div class="form-group">
                                    <label class="control-label col-md-4" for="origin">Origin</label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <span class="input-group-btn"><a class="btn btn-info search-geolocation btn-sm" title="Locate me!" ><span class="glyphicon glyphicon-map-marker"></span></a></span>
                                            <input type="text" id="origin" name="origin" pattern="-?[0-9\.]+,-?[0-9\.]+" title="Latitude,longitude" placeholder="Latitude, Longitude" value="${question.inputParameterMap["origin"]!}" class="form-control input-sm">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4" for="maxdist">Distance</label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input type="number" min="0" id="maxdist" name="maxdist" placeholder="e.g. 10" value="${question.inputParameterMap["maxdist"]!}" class="form-control input-sm">
                                            <span class="input-group-addon">km</span>
                                        </div>
                                    </div>
                                </div>

                            </fieldset>
                        </div>

                        <div class="col-md-4">
                            <fieldset>
                                <legend>Within</legend>
                                <div class="form-group">
                                    <label class="control-label col-md-4" for="scope">Domain</label>
                                    <div class="col-md-8">
                                        <input type="text" id="scope" name="scope" placeholder="e.g. example.com" value="${question.inputParameterMap["scope"]!}" class="form-control input-sm">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-4" for="meta_v">Path</label>
                                    <div class="col-md-8">
                                        <input type="text" id="meta_v" name="meta_v" placeholder="e.g. /plays/romeo-juliet" value="${question.inputParameterMap["meta_v"]!}" class="form-control input-sm">
                                    </div>
                                </div>
                            </fieldset>

                        </div>
                    </div>

                    <hr>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="pull-right">
                                <button type="button" data-toggle="collapse" data-target="#search-advanced" class="btn btn-default">Close</button>
                                <button class="btn btn-primary" type="submit"><span class="glyphicon glyphicon-cog"></span> Advanced Search</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <div id="search-results-content" class="row">

        <#-- Display tabbed faceted navigation -->
        <#if response.facets??>
            <#list response.facets as facet>
                <#if facet.allValues?size gt 0 && facet.guessedDisplayType == "TAB">
                    <div id="faceted-nav-tabs" class="col-md-12">
                        <ul class="nav nav-tabs">
                            <#list facet.allValues as value>
                                <li role="presentation" class="${(value.count?? && value.count lt 1)?then('disabled', '')} ${value.selected?then('active', '')}">
                                    <a href="${value.toggleUrl}" title="Show only '${value.label}'">${value.label}<#if value.count??> (${value.count})</#if></a>
                                </li>
                            </#list>
                        </ul>
                        <br>
                    </div>
                </#if>
            </#list>
        </#if>

        <div class="col-md-${response.facetExtras.hasNonTabFacets?then('9 col-md-push-3', '12')}">

            <#if question.collection.configuration.valueAsBoolean("ui.modern.session") && session.searchHistory?? && session.searchHistory?size gt 0>
            <#-- Build list of previous queries -->

                <#assign qsSignature = computeQueryStringSignature(QueryString) />
                <#if session.searchHistory?? && (session.searchHistory?size gt 1 || session.searchHistory[0].searchParamsSignature != qsSignature)>
                    <div class="breadcrumb session-history-breadcrumb">
                        <button class="btn btn-link pull-right session-history-show"><small class="text-muted"><span class="glyphicon glyphicon-plus"></span> More&hellip;</small></button>
                        <ol class="list-inline" >
                            <li class="text-muted">Recent:</li>
                            <#list session.searchHistory as h>
                                <#if h.searchParamsSignature != qsSignature>
                                    <#outputformat "plainText">
                                        <#assign facetDescription><#compress>
                                            <#list h.searchParams?matches("f\\.([^=]+)=([^&]+)") as f>
                                                ${urlDecode(f?groups[1])?split("|")[0]} = ${urlDecode(f?groups[2])}<#if f_has_next><br></#if>
                                            </#list>
                                        </#compress></#assign>
                                    </#outputformat>
                                    <li>
                                        <a <#if facetDescription != ""> data-toggle="tooltip" data-placement="bottom" title="${facetDescription}"</#if> title="${prettyTime(h.searchDate)}" href="${question.collection.configuration.value("ui.modern.search_link")}?${h.searchParams}">${h.originalQuery!} <small>(${h.totalMatching})</small></a>
                                        <#if facetDescription != ""><i class="glyphicon glyphicon-filter"></i></a></#if>
                                    </li>
                                </#if>
                            </#list>
                        </ol>
                    </div>
                </#if>
            </#if>

            <#if question.inputParameterMap["scope"]!?length != 0>
                <div class="breadcrumb">
                    <span class="text-muted"><span class="glyphicon glyphicon-resize-small"></span> Scope:</span> <@s.Truncate length=80>${question.inputParameterMap["scope"]!}</@s.Truncate>
                    <a class="button btn-xs" title="Remove scope: ${question.inputParameterMap["scope"]!}" href="?collection=${question.inputParameterMap["collection"]!}<#if question.inputParameterMap["profile"]??>&amp;profile=${question.inputParameterMap["profile"]!}</#if><#if question.inputParameterMap["form"]??>&amp;form=${question.inputParameterMap["form"]!}</#if>&amp;query=<@s.URLEncode><@s.QueryClean /></@s.URLEncode>"><span class="glyphicon glyphicon-remove text-muted"></span></a>
                </div>
            </#if>

            <div id="search-result-count" class="text-muted">
                <#if response.resultPacket.resultsSummary.totalMatching == 0>
                    <span id="search-total-matching">0</span> search results for <strong><@s.QueryClean /></strong>
                </#if>
                <#if response.resultPacket.resultsSummary.totalMatching != 0>
                    <span id="search-page-start">${response.resultPacket.resultsSummary.currStart}</span> -
                    <span id="search-page-end">${response.resultPacket.resultsSummary.currEnd}</span> of
                    <span id="search-total-matching">${response.resultPacket.resultsSummary.totalMatching?string.number}</span>
                    <#if question.inputParameterMap["s"]?? && question.inputParameterMap["s"]?contains("?:")><em>collapsed</em> </#if>search results for <strong><@s.QueryClean></@s.QueryClean></strong>
                </#if>

                <#if (response.resultPacket.resultsSummary.partiallyMatching!0) != 0>
                    where <span id="search-fully-matching">${response.resultPacket.resultsSummary.fullyMatching?string.number}</span>
                    match all words and <span id="search-partially-matching">${response.resultPacket.resultsSummary.partiallyMatching?string.number}</span>
                    match some words.
                </#if>
                <#if (response.resultPacket.resultsSummary.collapsed!0) != 0>
                    <span id="search-collapsed">${response.resultPacket.resultsSummary.collapsed}</span>
                    very similar results included.
                </#if>
            </div>

            <#-- Display applied faceted navigation -->
            <#if response.facetExtras.hasSelectedNonTabFacets>
                <div id="search-facets-breadcrumb"><span class="facets-breadcrumb-label">Refined by:</span>
                    <#list response.facets as facet>
                        <#if facet.selected && facet.guessedDisplayType != "TAB">
                            <ul class="facets-applied list-inline">
                                <li><a class="btn btn-xs btn-link" href="${facet.unselectAllUrl}" title="Remove all '${facet.name}' refinements">
                                        <small class="glyphicon glyphicon-remove"></small>
                                        <small class="hidden">&#10060;</small><#-- Fall back to Unicode chars if bootstrap is unavailable -->
                                        ${facet.name}
                                    </a></li>

                                <#list facet.selectedValues as value>
                                    <li><a class="btn btn-xs btn-info" href="${value.toggleUrl}" title="Remove '${facet.name}: ${value.label}'">
                                            <#if facet.guessedDisplayType == "SINGLE_DRILL_DOWN" && value?counter != 1><span>&#8627;</span></#if>
                                            <small class="glyphicon glyphicon-remove"></small>
                                            <small class="hidden">&#10060;</small><#-- Fall back to Unicode chars if bootstrap is unavailable -->
                                            ${value.label}
                                        </a></li>
                                </#list>
                            </ul>
                        </#if>
                    </#list>

                    <#if response.facetExtras.unselectAllFacetsUrl??>
                        <a class="btn btn-xs btn-default" href="${response.facetExtras.unselectAllFacetsUrl}" title="Remove all refinements">
                            <small class="glyphicon glyphicon-remove"></small>
                            <small class="hidden">&#10060;</small><#-- Fall back to Unicode chars if bootstrap is unavailable -->
                            Clear all filters
                        </a>
                    </#if>
                </div>
            </#if>

            <#if (response.resultPacket.QSups)!?size gt 0>
                <div class="alert alert-info">
                    <@fb.CheckBlending linkText="Search for <em>"+question.originalQuery+"</em> instead." tag="strong" />
                </div>
            </#if>

            <#if (response.curator.exhibits)!?size gt 0>
                <#list response.curator.exhibits as exhibit>
                    <#if exhibit.messageHtml??>
                        <blockquote class="search-curator-message">
                            ${exhibit.messageHtml?no_esc}
                        </blockquote>
                    </#if>
                </#list>
            </#if>

            <@s.CheckSpelling prefix="<h3 id=\"search-spelling\"><span class=\"glyphicon glyphicon-question-sign text-muted\"></span> Did you mean <em>" suffix="</em>?</h3>" />

            <h2 class="visible-print">Results</h2>

            <#if response.resultPacket.resultsSummary.totalMatching == 0>
                <h3><span class="glyphicon glyphicon-warning-sign"></span> No results</h3>
                <p>Your search for <strong>${question.originalQuery!}</strong> did not return any results. Please ensure that you:</p>
                <ul>
                    <li>are not using any advanced search operators like + - | " etc.</li>
                    <li>expect this document to exist within the <em><@s.cfg>service_name</@s.cfg></em> collection <@s.IfDefCGI name="scope"> and within <em><@s.Truncate length=80>${question.inputParameterMap["scope"]!}</@s.Truncate></em></@s.IfDefCGI></li>
                    <li>have permission to see any documents that may match your query</li>
                </ul>
            </#if>

            <#assign curatorAdvertPresent = false />
            <#list response.curator.exhibits as exhibit>
                <#if exhibit.titleHtml?? && exhibit.linkUrl??>
                    <#assign curatorAdvertPresent = true />
                    <#break>
                </#if>
            </#list>

            <#if (response.resultPacket.bestBets)!?size gt 0 || curatorAdvertPresent >
                <ol id="search-best-bets" class="list-unstyled">
                    <#-- Curator exhibits -->
                    <#list response.curator.exhibits as exhibit>
                        <#if exhibit.titleHtml?? && exhibit.linkUrl??>
                            <li class="alert alert-warning">
                                <h4><a href="${exhibit.linkUrl}"><@s.boldicize>${exhibit.titleHtml?no_esc}</@s.boldicize></a></h4>
                                <#if exhibit.displayUrl??><cite class="text-success">${exhibit.displayUrl}</cite></#if>
                                <#if exhibit.descriptionHtml??><p><@s.boldicize>${exhibit.descriptionHtml?no_esc}</@s.boldicize></p></#if>
                            </li>
                        </#if>
                    </#list>
                    <#-- Old-style best bets -->
                    <@s.BestBets>
                        <li class="alert alert-warning">
                            <#if s.bb.title??><h4><a href="${s.bb.clickTrackingUrl}"><@s.boldicize>${s.bb.title}</@s.boldicize></a></h4></#if>
                            <#if s.bb.title??><cite class="text-success">${s.bb.link}</cite></#if>
                            <#if s.bb.description??><p><@s.boldicize>${s.bb.description?no_esc}</@s.boldicize></p></#if>
                            <#if ! s.bb.title??><p><strong>${s.bb.trigger}:</strong> <a href="${s.bb.link}">${s.bb.link}</a></#if>
                        </li>
                    </@s.BestBets>
                </ol>
            </#if>

            <ol id="search-results" class="list-unstyled" start="${response.resultPacket.resultsSummary.currStart}">
                <@s.Results>
                    <#if s.result.class.simpleName == "TierBar">
                    <#-- A tier bar -->
                        <#if s.result.matched != s.result.outOf>
                            <li class="search-tier"><h3 class="text-muted">Results that match ${s.result.matched} of ${s.result.outOf} words</h3></li>
                        <#else>
                            <li class="search-tier"><h3 class="hidden">Fully-matching results</h3></li>
                        </#if>
                    <#-- Print event tier bars if they exist -->
                        <#if s.result.eventDate??>
                            <h2 class="fb-title">Events on ${s.result.eventDate?date}</h2>
                        </#if>
                    <#else>
                        <li data-fb-result="${s.result.indexUrl}" class="result<#if !s.result.documentVisibleToUser>-undisclosed</#if>">

                            <h4 <#if !s.result.documentVisibleToUser>style="margin-bottom:4px"</#if>>
                                <#if !s.result.documentVisibleToUser>
                                    <span class="text-muted">Undisclosed search result</span>
                                <#else>
                                    <a href="${s.result.clickTrackingUrl}" title="${s.result.liveUrl}">
                                        <@s.boldicize><@s.Truncate length=140>${s.result.title}</@s.Truncate></@s.boldicize>
                                    </a>
                                </#if>

                                <#if s.result.fileType!?matches("(doc|docx|ppt|pptx|rtf|xls|xlsx|xlsm|pdf)", "r")>
                                    <small class="text-muted">${s.result.fileType?upper_case} (${filesize(s.result.fileSize!0)})</small>
                                </#if>
                                <#if question.collection.configuration.valueAsBoolean("ui.modern.session") && session?? && session.getClickHistory(s.result.indexUrl)??><small class="text-warning session-history-link"><span class="glyphicon glyphicon-time"></span> <a title="Click history" href="#" class="text-warning session-history-show">Last visited ${prettyTime(session.getClickHistory(s.result.indexUrl).clickDate)}</a></small></#if>
                            </h4>

                            <#if !s.result.documentVisibleToUser>
                                <cite data-url="null" class="text-muted <#if !s.result.documentVisibleToUser> hide</#if>">undisclosed</cite>
                            <#else>
                                <cite data-url="${s.result.displayUrl}" class="text-success"><@s.cut cut="http://"><@s.boldicize>${s.result.displayUrl}</@s.boldicize></@s.cut></cite>
                            </#if>

                            <#if s.result.documentVisibleToUser>
                                <div class="btn-group">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" title="More actions&hellip;"><small class="glyphicon glyphicon-chevron-down text-success"></small></a>
                                    <ul class="dropdown-menu">
                                        <li><#if s.result.cacheUrl??><a href="${s.result.cacheUrl}&amp;hl=${response.resultPacket.queryHighlightRegex!?url}" title="Cached version of ${s.result.title} (${s.result.rank})">Cached</a></#if></li>
                                        <li><@s.Explore /></li>
                                        <@fb.AdminUIOnly><li><@fb.Optimise /></li></@fb.AdminUIOnly>
                                    </ul>
                                </div>
                            </#if>

                            <@s.Quicklinks>
                                <ul class="list-inline">
                                    <@s.QuickRepeat><li><a href="${s.ql.url}" title="${s.ql.text}">${s.ql.text}</a></li></@s.QuickRepeat>
                                </ul>
                                <#if question.collection.quickLinksConfiguration["quicklinks.domain_searchbox"]?? && question.collection.quickLinksConfiguration["quicklinks.domain_searchbox"] == "true">
                                    <#if s.result.quickLinks.domain?matches("^[^/]*/?[^/]*$", "r")>
                                        <form class="quicklinks" action="${question.collection.configuration.value("ui.modern.search_link")}" method="GET">
                                            <input type="hidden" name="collection" value="${question.inputParameterMap["collection"]!}">
                                            <input type="hidden" name="meta_u_sand" value="${s.result.quickLinks.domain}">
                                            <@s.IfDefCGI name="enc"><input type="hidden" name="enc" value="${question.inputParameterMap["enc"]!}"></@s.IfDefCGI>
                                            <@s.IfDefCGI name="form"><input type="hidden" name="form" value="${question.inputParameterMap["form"]!}"></@s.IfDefCGI>
                                            <@s.IfDefCGI name="scope"><input type="hidden" name="scope" value="${question.inputParameterMap["scope"]!}"></@s.IfDefCGI>
                                            <@s.IfDefCGI name="profile"><input type="hidden" name="profile" value="${question.inputParameterMap["profile"]!}"></@s.IfDefCGI>
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <div class="input-group input-sm">
                                                        <input required title="Search query" name="query" type="text" class="form-control" placeholder="Search ${s.result.quickLinks.domain}&hellip;">
                                                        <div class="input-group-btn">
                                                            <button type="submit" class="btn btn-info"><span class="glyphicon glyphicon-search"></span></button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </#if>
                                </#if>
                            </@s.Quicklinks>

                            <#if s.result.summary??>
                                <p>
                                    <#if s.result.date??><small class="text-muted">${s.result.date?date?string("d MMM yyyy")}:</small></#if>
                                    <span class="search-summary"><@s.boldicize>${s.result.summary?no_esc}</@s.boldicize></span>
                                </p>
                            <#else>
                                <#if s.result.metaData["c"]??><p><@s.boldicize>${s.result.metaData["c"]!}</@s.boldicize></p></#if>
                            </#if>

                            <#if !s.result.documentVisibleToUser>
                                <p>
                                    <span class="search-summary text-muted"><em>Information for this search result cannot be shown for sensitivity reasons.</em></span>
                                </p>
                            </#if>

                            <#if s.result.collapsed??>
                                <div class="search-collapsed"><small><span class="glyphicon glyphicon-expand text-muted"></span>&nbsp; <@fb.Collapsed /></small></div>
                            </#if>

                            <dl class="dl-horizontal text-muted">
                                <#assign metaDataClassDisplayLabels = {"d": "Date"} />
                                <#list s.result.listMetadata?keys as metaDataKey>
                                    <#if metaDataKey != "t" && metaDataKey != "c" && !metaDataKey?starts_with("Fun")>
                                        <#assign metaDataLabel = (metaDataClassDisplayLabels[metaDataKey])!metaDataKey />
                                        <dt>${metaDataLabel}:</dt><dd>${s.result.listMetadata[metaDataKey]?join(", ")}</dd>
                                    </#if>
                                </#list>
                            </dl>
                        </li>
                    </#if>
                </@s.Results>
            </ol>

            <@s.ContextualNavigation>
                <@s.ClusterNavLayout />
                <@s.NoClustersFound />
                <@s.ClusterLayout>
                    <div class="well" id="search-contextual-navigation">
                        <h3>Related searches for <strong><@s.QueryClean /></strong></h3>
                        <div class="row">
                            <@s.Category name="type">
                                <div class="col-md-4 search-contextual-navigation-type">
                                    <h4>Types of <strong>${s.contextualNavigation.searchTerm}</strong></h4>
                                    <ul class="list-unstyled">
                                        <@s.Clusters><li><a href="${s.cluster.href}"><#noautoesc>${s.cluster.label?html?replace("...", " <strong>"+s.contextualNavigation.searchTerm?html+"</strong> ")}</#noautoesc></a></li></@s.Clusters>
                                        <@s.ShowMoreClusters category="type"><li><a rel="more" href="${changeParam(s.category.moreLink, "type_max_clusters", "40")}" class="btn btn-link btn-sm"><small class="glyphicon glyphicon-plus"></small> More&hellip;</a></li></@s.ShowMoreClusters>
                                        <@s.ShowFewerClusters category="type" />
                                    </ul>
                                </div>
                            </@s.Category>

                            <@s.Category name="topic">
                                <div class="col-md-4 search-contextual-navigation-topic">
                                    <h4>Topics on <strong>${s.contextualNavigation.searchTerm}</strong></h4>
                                    <ul class="list-unstyled">
                                        <@s.Clusters><li><a href="${s.cluster.href}"><#noautoesc>${s.cluster.label?html?replace("...", " <strong>"+s.contextualNavigation.searchTerm?html+"</strong> ")}</#noautoesc></a></li></@s.Clusters>
                                        <@s.ShowMoreClusters category="topic"><li><a rel="more" href="${changeParam(s.category.moreLink, "topic_max_clusters", "40")}" class="btn btn-link btn-sm"><small class="glyphicon glyphicon-plus"></small> More&hellip;</a></li></@s.ShowMoreClusters>
                                        <@s.ShowFewerClusters category="topic" />
                                    </ul>
                                </div>
                            </@s.Category>

                            <@s.Category name="site">
                                <div class="col-md-4 search-contextual-navigation-site">
                                    <h4><strong>${s.contextualNavigation.searchTerm}</strong> by site</h4>
                                    <ul class="list-unstyled">
                                        <@s.Clusters><li><a href="${s.cluster.href}"> ${s.cluster.label}</a></li></@s.Clusters>
                                        <@s.ShowMoreClusters category="site"><li><a rel="more" href="${changeParam(s.category.moreLink, "site_max_clusters", "40")}" class="btn btn-link btn-sm"><small class="glyphicon glyphicon-plus"></small> More&hellip;</a></li></@s.ShowMoreClusters>
                                        <@s.ShowFewerClusters category="site" />
                                    </ul>
                                </div>
                            </@s.Category>
                        </div>
                    </div>
                </@s.ClusterLayout>
            </@s.ContextualNavigation>

            <div class="text-center hidden-print">
                <h2 class="sr-only">Pagination</h2>
                <ul class="pagination pagination-lg">
                    <@fb.Prev><li><a href="${fb.prevUrl}" rel="prev"><small><i class="glyphicon glyphicon-chevron-left"></i></small> Prev</a></li></@fb.Prev>
                    <@fb.Page numPages=5><li <#if fb.pageCurrent> class="active"</#if>><a href="${fb.pageUrl}">${fb.pageNumber}</a></li></@fb.Page>
                    <@fb.Next><li><a href="${fb.nextUrl}" rel="next">Next <small><i class="glyphicon glyphicon-chevron-right"></i></small></a></li></@fb.Next>
                </ul>
            </div>

        </div>

        <#-- Display faceted navigation -->
        <#if response.facets?? && response.facets?size gt 0>
            <div class="col-md-3 col-md-pull-9 hidden-print">
                <h2 class="sr-only">Refine</h2>

                <div class="panel-group flb-panel" id="search-facets" role="tablist">
                    <#list response.facets as facet>
                        <#if facet.allValues?size gt 0 && facet.guessedDisplayType != "TAB">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <a class="panel-toggle" data-target="#facet-${facet?counter}" data-toggle="collapse" aria-expanded="true" aria-controls="facet-${facet?counter}">
                                        ${facet.name}
                                    </a>

                                    <#if facet.selected>
                                        <a href="${facet.unselectAllUrl}" class="btn btn-link btn-sm" title="Remove all '${facet.name}' refinements">
                                            <small class="glyphicon glyphicon-remove"></small><small class="hidden">&#10060;</small> Clear all
                                        </a>
                                    </#if>
                                </div>

                                <div class="list-group panel-collapse collapse in" id="facet-${facet?counter}">
                                    <#list facet.allValues as value>
                                        <#if value?counter == 9><div id="facet-list-${facet?counter}" class="collapse"></#if>
                                        <#assign isDisabled = value.count?? && value.count lt 1 && !value.selected />
                                        <a class="list-group-item ${(value.selected)?then('selected-' + facet.guessedDisplayType?lower_case, '')} ${isDisabled?then('disabled', '')}" href="${isDisabled?then('#', value.toggleUrl)}" title="${(value.selected)?then('Remove', 'Refine by')} '${facet.name}: ${value.label}'">
                                            <#-- Show the category value e.g. 🔘 Bob, ☑ Bob, ❌ Bob  -->
                                            <span class="item-label">
                    <#if facet.guessedDisplayType == 'RADIO_BUTTON'>
                        <span class="${value.selected?then('glyphicon glyphicon-record', 'radio-unchecked')}"></span>
                        <span class="hidden">${value.selected?then('&#128280;', '&#9711;')?no_esc}</span><#-- Fall back to Unicode chars if bootstrap is unavailable -->
                    <#elseif facet.guessedDisplayType == 'CHECKBOX'>
                        <span class="glyphicon glyphicon-${value.selected?then('check', 'unchecked')}"></span>
                        <span class="hidden">${value.selected?then('&#9745;', '&#9744;')?no_esc}</span><#-- Fall back to Unicode chars if bootstrap is unavailable -->
                    <#elseif value.selected>
                        <#if facet.guessedDisplayType == "SINGLE_DRILL_DOWN" && value?counter != 1><span style="margin-left: ${(value?counter - 1) * 10}px">&#8627;</span></#if>
                      <small class="glyphicon glyphicon-remove"></small>
                        <small class="hidden">&#10060;</small><#-- Fall back to Unicode chars if bootstrap is unavailable -->
                    </#if>
                                                ${value.label}
                  </span>
                                            <#if value.count?? && !value.selected><span class="badge">${value.count}</span></#if>
                                        </a>

                                    <#-- Limit the number of category values shown to the user initially -->
                                        <#if !value_has_next && facet.allValues?size gt 8>
                                            </div>
                                            <a class="list-group-item collapse-trigger collapsed" data-target="#facet-list-${facet?counter}" data-toggle="collapse"></a>
                                        </#if>
                                    </#list>
                                </div>
                            </div>
                        </#if>
                    </#list>
                </div>
            </div>
        </#if>

    </div>

    <#if question.collection.configuration.valueAsBoolean("ui.modern.session")>
    <div id="search-history">
        <div class="row">
            <div class="col-md-12">
                <a href="#" class="session-history-hide"><span class="glyphicon glyphicon-arrow-left"></span> Back to results</a>
                <h2><span class="glyphicon glyphicon-time"></span> History</h2>

                <div class="row">
                    <div class="col-md-6">
                        <h3>
                            <span class="glyphicon glyphicon-heart"></span> Recently clicked results
                            <button class="btn btn-danger btn-xs session-history-clear-click" title="Clear click history"><span class="glyphicon glyphicon-remove"></span> Clear</button>
                        </h3>
                        <#list session.clickHistory>
                            <ul class="session-history-click-results">
                                <#items as h>
                                    <li><a href="${h.indexUrl}">${h.title}</a> &middot; <span class="text-warning">${prettyTime(h.clickDate)}</span><#if h.query??><span class="text-muted"> for &quot;${h.query!}&quot;</#if></span></li>
                                </#items>
                            </ul>
                        </#list>
                        <p class="session-history-click-empty text-muted">Your click history is empty.</p>
                    </div>
                    <div class="col-md-6">
                        <h3>
                            <span class="glyphicon glyphicon-search"></span> Recent searches
                            <button class="btn btn-danger btn-xs session-history-clear-search" title="Clear search history"><span class="glyphicon glyphicon-remove"></span> Clear</button>
                        </h3>
                        <#list session.searchHistory>
                            <ul class="session-history-search-results list-unstyled">
                                <#items as h>
                                    <li><a href="?${h.searchParams}">${h.originalQuery!} <small>(${h.totalMatching})</small></a> &middot; <span class="text-warning">${prettyTime(h.searchDate)}</span></li>
                                </#items>
                            </ul>
                        </#list>
                        <p class="session-history-search-empty text-muted">Your search history is empty.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="search-cart"></div>

</div>
</#if>


<div class="hidden-print">
    <h2 class="sr-only">Tools</h2>
    <div id="search-performance" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal" data-target="#search-performance">&times;</button>
                    <h3>Performance</h3>
                </div>
                <div class="modal-body">
                    <@fb.PerformanceMetrics class="search-metrics table-striped table table-condensed" tdClass="progress-bar progress-bar-info" width=200 title=""/>
                </div>
            </div>
        </div>
    </div>

    <div id="search-syntaxtree" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button class="close" data-dismiss="modal" data-target="#search-syntaxtree">&times;</button>
                    <h3>Query syntax tree</h3>
                </div>
                <div class="modal-body">
                    <#if response?? && response.resultPacket??
                    && response.resultPacket.svgs??
                    && response.resultPacket.svgs["syntaxtree"]??>
                        ${response.resultPacket.svgs["syntaxtree"]?no_esc}
                    <#else>
                        <div class="alert alert-warning">Query syntax tree unavailable. Make sure the <code>-show_qsyntax_tree=on</code> query processor option is set.</div>
                    </#if>
                </div>
            </div>
        </div>
    </div>
</div>

</@s.AfterSearchOnly>

<footer>
    <hr>
    <p class="text-muted text-center"><small>
            <#if (response.resultPacket.details.collectionUpdated)??>Collection last updated: ${response.resultPacket.details.collectionUpdated?datetime}.<br></#if>
            Search powered by <a href="http://www.funnelback.com">Funnelback</a>.
        </small></p>
</footer>

</div>

<script src="${GlobalResourcesPrefix}thirdparty/bootstrap-3.3.7/js/bootstrap.min.js"></script>

<#if question.collection.configuration.value('auto-completion') == 'enabled'>
    <script src="${GlobalResourcesPrefix}thirdparty/typeahead-0.11.1/typeahead.bundle.min.js"></script>
    <script src="${GlobalResourcesPrefix}thirdparty/handlebars-4.1/handlebars.min.js"></script>
    <script src="${GlobalResourcesPrefix}js/funnelback.autocompletion-2.6.0.js"></script>
    <script>
      jQuery(document).ready(function() {
        jQuery('input.query').autocompletion({
          datasets: {
            <#if question.collection.configuration.valueAsBoolean('auto-completion.standard.enabled')>
            organic: {
              collection: '${question.collection.id}',
              profile : '${question.profile}',
              program: '<@s.cfg>auto-completion.program</@s.cfg>',
              format: '<@s.cfg>auto-completion.format</@s.cfg>',
              alpha: '<@s.cfg>auto-completion.alpha</@s.cfg>',
              show: '<@s.cfg>auto-completion.show</@s.cfg>',
              sort: '<@s.cfg>auto-completion.sort</@s.cfg>',
              group: true
            },
            </#if>
            <#if question.collection.configuration.valueAsBoolean('auto-completion.search.enabled')>
            facets: {
              collection: '${question.collection.id}',
              itemLabel: function(suggestion) { return suggestion.query + ' in ' + suggestion.label; },
              profile : '${question.profile}',
              program: '<@s.cfg>auto-completion.search.program</@s.cfg>',
              queryKey: 'query',
              transform: $.autocompletion.processSetDataFacets,
              group: true,
              template: {
                suggestion: '<div>{{query}} in {{label}}</div>'
              }
            },
            </#if>
          },
          typeahead: {hint: true},
          length: <@s.cfg>auto-completion.length</@s.cfg>
        });
      });
    </script>
</#if>

<#if question.collection.configuration.valueAsBoolean("ui.modern.session")>
    <script type="text/javascript" src="${GlobalResourcesPrefix}thirdparty/es6-promise-4.2.5/es6-promise.auto.min.js"></script>
    <script type="text/javascript" src="${GlobalResourcesPrefix}js/funnelback.session-cart-0.1.min.js"></script>
    <script type="text/javascript" src="${GlobalResourcesPrefix}js/funnelback.session-history-0.1.min.js"></script>

    <script type="text/javascript">
      var flbSessionCart = new Funnelback.SessionCart({collection: '${question.collection.id}'});
      var flbSessionHistory = new Funnelback.SessionHistory({collection: '${question.collection.id}'});
    </script>
</#if>

<script>
  jQuery(document).ready( function() {
    // jQuery.widget.bridge('uitooltip', jQuery.ui.tooltip);

    jQuery('[data-toggle=tooltip]').tooltip({'html': true});

    jQuery('.search-geolocation').click( function() {
      try {
        navigator.geolocation.getCurrentPosition( function(position) {
          // Success
          var latitude  = Math.ceil(position.coords.latitude*10000) / 10000;
          var longitude = Math.ceil(position.coords.longitude*10000) / 10000;
          var origin = latitude+','+longitude;
          jQuery('#origin').val(origin);
        }, function (error) {
          // Error
        }, { enableHighAccuracy: true });
      } catch (e) {
        alert('Your web browser doesn\'t support this feature');
      }
    });
  });
</script>

</body>
</html>
<#-- vim: set expandtab ts=2 sw=2 sts=2 :-->
