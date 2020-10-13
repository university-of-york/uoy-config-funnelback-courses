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
                "title": <#if s.result.metaData.courseTitle??>
                    "${s.result.metaData.courseTitle?json_string}"
                <#elseif s.result.metaData.t?json_string??>
                    "${s.result.metaData.t?json_string}"
                <#else>null</#if>
                "liveUrl": <#if s.result.metaData.liveUrl??>"${s.result.metaData.liveUrl?json_string}"<#else>null</#if>
                "award": <#if s.result.metaData.courseAward??>"${s.result.metaData.courseAward?json_string}"<#else>null</#if>
                "department": <#if s.result.metaData.courseDepartment??>"${s.result.metaData.courseDepartment?json_string}"<#else>null</#if>
                "level": <#if s.result.metaData.courseLevel??>"${s.result.metaData.courseLevel?json_string}"<#else>null</#if>
                "length": <#if s.result.metaData.courseLength??>"${s.result.metaData.courseLength?json_string}"<#else>null</#if>
                "typicalOffer": <#if s.result.metaData.courseTypicalOffer??>"${s.result.metaData.courseTypicalOffer?json_string}"<#else>"N/A"</#if>,
                "yearOfEntry": <#if s.result.metaData.courseYearOfEntry??>"${s.result.metaData.courseYearOfEntry?json_string}"<#else>null</#if>
                "distanceLearning": <#if s.result.metaData.courseDistanceLearning??>"${s.result.metaData.courseDistanceLearning?json_string}"<#else>null</#if>,
                "summary":<#if s.result.metaData.c??>"${s.result.metaData.c?json_string}"<#else>null</#if>
                "imageUrl": <#if s.result.metaData.I??>"${s.result.metaData.I?json_string}"<#else>null</#if>
                "ucasCode": <#if s.result.metaData.courseUcasCode??>"${s.result.metaData.courseUcasCode?json_string}"<#else>null</#if>
                }
                <#if s.result.rank &lt; response.resultPacket.resultsSummary.currEnd>,</#if>
            </#if>
        </@s.Results>
        ]
        }
        <#if RequestParameters.callback?has_content>);</#if>
    </@s.AfterSearchOnly>
</#compress>