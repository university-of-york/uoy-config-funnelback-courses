<#ftl encoding="utf-8" />
<#import "/web/templates/modernui/funnelback_classic.ftl" as s/>
<#import "/web/templates/modernui/funnelback.ftl" as fb/>
<#compress>
<#-- course-search.ftl

Outputs Funnelback response in JSON format, with callback if 'callback' parameter is included in query string

Date: August 2020
Author: Nicola Normandale (with thanks to Nick Pearson)

See also:
http://docs.funnelback.com/ui_modern_form_content_type_collection_cfg.html

-->
    <@fb.ViewModeBanner />
    <@fb.ErrorMessage />
    <@s.InitialFormOnly>
    </@s.InitialFormOnly>
    <@s.AfterSearchOnly>
    <#-- CALLBACK -->
        <#if RequestParameters.callback?has_content>${RequestParameters.callback}(</#if>
    <#-- NO RESULTS -->
        <#if response.resultPacket.resultsSummary.totalMatching == 0>
            {
            "resp":{
            "code":400,
            "status":"ERROR",
            "errorMessage":"No matching results."
            }
            }
        <#else>
        <#-- RESULTS -->
            {
            "results": [
            <@s.Results>
                <#if s.result.class.simpleName == "TierBar">
                    <#if s.result.matched == s.result.outOf>
                    <#else></#if>
                <#else>
                <#-- EACH RESULT -->
                    {
                    "title": "${s.result.metadata.courseTitle}",
                    "liveUrl": "${s.result.liveUrl}",
                    "award": "${s.result.metaData.courseAward}",
                    "department": "${s.result.metaData.courseDepartment}",
                    "level": "${s.result.metaData.courseLevel}",
                    "length": "${s.result.metaData.courseLength}",
                    "typicalOffer": <#if s.result.metaData.courseTypicalOffer??>"${s.result.metaData.courseTypicalOffer}"<#else>"N/A"</#if>.
                    "yearOfEntry": "${s.result.metaData.courseYearOfEntry}",
                    "distanceLearning": "${s.result.metaData.courseDistanceLearning}",
                    "summarySentence": "${s.result.metaData.c}",
                    "associatedImage": "${s.result.metaData.I}"
                    }<#if s.result.rank &lt; response.resultPacket.resultsSummary.currEnd>,</#if>
                </#if>
            </@s.Results>
            ]
            }
        </#if>
        <#if RequestParameters.callback?has_content>);</#if>
    </@s.AfterSearchOnly>
</#compress>
