<#ftl encoding="utf-8" />
<#import "/web/templates/modernui/funnelback_classic.ftl" as s/>
<#import "/web/templates/modernui/funnelback.ftl" as fb/>
<#compress>
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
                "title": "${s.result.metaData.courseTitle?json_string}",
                "liveUrl": "${s.result.liveUrl?json_string}",
                "award": "${s.result.metaData.courseAward?json_string}",
                "department": "${s.result.metaData.courseDepartment?json_string}",
                "level": "${s.result.metaData.courseLevel?json_string}",
                "length": "${s.result.metaData.courseLength?json_string}",
                "typicalOffer": <#if s.result.metaData.courseTypicalOffer??>"${s.result.metaData.courseTypicalOffer?json_string}"<#else>"N/A"</#if>,
                "yearOfEntry": "${s.result.metaData.courseYearOfEntry?json_string}",
                "distanceLearning": <#if s.result.metaData.courseDistanceLearning??>"${s.result.metaData.courseDistanceLearning?json_string}"<#else>null</#if>,
                "summary": "${s.result.metaData.c?json_string}",
                "imageUrl": "${s.result.metaData.I?json_string}",
                "ucasCode": <#if s.result.metaData.courseUcasCode??>"${s.result.metaData.courseUcasCode?json_string}"<#else>null</#if>
                }<#if s.result.rank &lt; response.resultPacket.resultsSummary.currEnd>,</#if>
            </#if>
        </@s.Results>
        ]
        }
        <#if RequestParameters.callback?has_content>);</#if>
    </@s.AfterSearchOnly>
</#compress>