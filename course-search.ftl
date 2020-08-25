<#ftl encoding="utf-8" />
<#import "/web/templates/modernui/funnelback_classic.ftl" as s/>
<#import "/web/templates/modernui/funnelback.ftl" as fb/>
<#compress>
<#-- course-search.ftl

Outputs Funnelback response in JSON format, with callback if 'callback' parameter is included in query string

See also:
http://docs.funnelback.com/ui_modern_form_content_type_collection_cfg.html

-->
    <@fb.ViewModeBanner />
    <@fb.ErrorMessage />
    <@s.AfterSearchOnly>
    <#-- ie. conditional display, content is evaluated only when there are results. -->
    <#-- CALLBACK -->
        <#if RequestParameters.callback?has_content>${RequestParameters.callback}(</#if>
        {
        "results": [
        <@s.Results>
            <#if s.result.class.simpleName != "TierBar"><#-- TierBar is a sort of sub-heading, so we need to ignore any -->
            <#-- EACH RESULT -->
                {
                "title": "${s.result.metaData.courseTitle}",
                "liveUrl": "${s.result.liveUrl}",
                "award": "${s.result.metaData.courseAward}",
                "department": "${s.result.metaData.courseDepartment}",
                "level": "${s.result.metaData.courseLevel}",
                "length": "${s.result.metaData.courseLength}",
                "typicalOffer": <#if s.result.metaData.courseTypicalOffer??>"${s.result.metaData.courseTypicalOffer}"<#else>"N/A"</#if>.
                "yearOfEntry": "${s.result.metaData.courseYearOfEntry}",
                "distanceLearning": "${s.result.metaData.courseDistanceLearning}",
                "summary": "${s.result.metaData.c}",
                "imageUrl": "${s.result.metaData.I}"
                }<#if s.result.rank &lt; response.resultPacket.resultsSummary.currEnd>,</#if>
            </#if>
        </@s.Results>
        ]
        }
        <#if RequestParameters.callback?has_content>);</#if>
    </@s.AfterSearchOnly>
</#compress>