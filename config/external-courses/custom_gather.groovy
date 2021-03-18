import com.funnelback.common.*
import com.funnelback.common.config.*
import com.funnelback.common.io.store.*
import com.funnelback.common.io.store.bytes.*
import com.funnelback.common.io.store.xml.*
import com.funnelback.common.utils.*
import com.google.common.collect.Multimap
import com.google.common.collect.ArrayListMultimap

// XML imports
import org.w3c.dom.Document

//JSON imports
import org.json.JSONObject


// Read $SEARCH_HOME - this is in all custom gather scripts
String searchHome = Environment.getValidSearchHome().getCanonicalPath()

// Create a configuration object to read collection.cfg
NoOptionsConfig config = new NoOptionsConfig(new File(args[0]), args[1])

// Create an XML Store instance to store gathered data
WarcXmlStore store = new XmlStoreFactory(config).newStore()
store.open()

//retrieve course information as JSON
String coursesUrl = config.value("start_url")
String coursesText = new URL(coursesUrl).getText(requestProperties: [Accept: 'application/hal+json, application/json, */*'])
JSONObject coursesJson = new JSONObject(coursesText)


def numRecords = coursesJson.courses.size()
println "Number of courses is " + numRecords

coursesJson.courses.eachWithIndex { course, i ->
    //skip empty records, there is always a false record at the end of the CMS output
    if (!course) {
        println "Record " + i + " of " + numRecords + " is false, skipping..."
        return
    }

    // Check to see if the update has been manually stopped every 100 records
    if (i % 100 == 0) {
        if (config.isUpdateStopped()) {
            store.close()
            throw new RuntimeException("Update stop requested by user.")
        }
        config.setProgressMessage("Processed " + i + " records")
        println "Processed " + i + " records"
    }

    config.setProgressMessage("Processing record " + i + " of " + numRecords)
    println "Processing record " + i + " of " + numRecords


    String xml = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<item><title>" + course.courseTitle + "</title>\n<summary>" + course.courseDescription + "</summary></item>"

    Document xmlContent = XMLUtils.fromString(xml)
    XmlRecord record = new XmlRecord(xmlContent, course.courseUrl)

    Multimap metadata = ArrayListMultimap.create()

    metadata.put("courseTitle", course.courseTitle)
    metadata.put("courseLevel", course.courseLevel)
    metadata.put("courseAward", course.courseAward)
    metadata.put("courseTypicalOffer", course.courseTypicalOffer)
    metadata.put("courseDepartment", course.courseDepartment)
    metadata.put("courseUcasCode", course.courseUcasCode)
    metadata.put("courseLength", course.courseLength)
    metadata.put("courseDistanceLearning", course.courseDistanceLearning)
    metadata.put("courseUrl", course.courseUrl)
    metadata.put("courseYearOfEntry", course.courseYearOfEntry)
    metadata.put("courseName", course.courseName)
    metadata.put("courseContent", course.courseContent)
    metadata.put("contentType", course.contentType)

    store.add(record, metadata)
}

// close() required for the store to be flushed
store.close()
