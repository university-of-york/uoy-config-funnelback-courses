> **Note**
> This application was retired on 10/05/2023.

# Funnelback Courses API

This repo contains configuration for the University of York's Course Search powered by [Funnelback](https://www.funnelback.com/). 
This configures a collection of course information within Funnelback, which can be queried as an API returning JSON.

## Related Repos

- [Course Search](https://github.com/university-of-york/uoy-app-course-search) - the user-facing Course Search application on the University of York website.
- [Courses API](https://github.com/university-of-york/uoy-api-courses) - the API that provides Course Search functionality and in turn calls the Funnelback Courses API.

## Consuming the API

The Funnelback Courses API is available at [https://york.funnelback.co.uk/search?collection=courses&profile=_default&form=course-search&smeta_contentType=course&query=History](https://york.funnelback.co.uk/search?collection=courses&profile=_default&form=course-search&smeta_contentType=course&query=History) (update the `query` parameter with your search term).

Currently this defaults to bringing back 10 results.
* To retrieve 25 entries in the results array, add `&num_ranks=25` to the URL.
* To retrieve from entry 11, add `&start_rank=11` to the URL.

The [latest version of the API specification](https://university-of-york.github.io/uoy-config-funnelback-courses) is published and kept up-to-date automatically. It is defined using the [OpenAPI specification](https://swagger.io/docs/specification/about/) and is served as a static site using a distribution of [Swagger-UI](https://github.com/swagger-api/swagger-ui/tree/master/dist).

## Funnelback

### Collections

A Funnelback collection is a set of data that can be searched. It is possible for collections to contain other collections, as the `york-uni-campusmap` collection contains others.

There are three collections for courses.
- `york-uni-courses` is powered by a web crawler that indexes all York courses.
- `external-courses` is a [custom collection](https://docs.squiz.net/funnelback/archive/collections/collection-types/custom.html) 
  that contains details on HYMS courses published by the CMS.
- `courses` is a [meta collection](https://docs.squiz.net/funnelback/archive/collections/collection-types/meta/index.html) that combines both of the other collections.

The course collection we use for the courses API is `courses`.

### Search Templates

Search templates are `*.ftl` files that determine the format of results from Funnelback.

The __course-search template__ outputs just the course fields the Courses API requires as a Funnelback response in JSON format, 
with callback if 'callback' parameter is included in query string. 

In the version of Funnelback currently in use (15.24), it requires the following line in the collections.cfg file so it 
will return the results with a content type of application/json:

    ui.modern.form.course-search.content_type=application/json

See [UI Modern Form Content Type (collection.cfg)](https://docs.funnelback.com/15.10/more/extra/ui_modern_form_content_type_collection_cfg.html)

## Development

Useful resources:
* [Funnelback Documentation](https://docs.funnelback.com/)
* [OpenAPI Documentation](https://swagger.io/docs/specification/)

### Prerequisites

You will need a Funnelback (v15.10+) account with the necessary permissions to maintain collections.

### Testing

Funnelback collections have two profiles, for 'Live' and 'Preview'. The preview profile can be used for testing 
purposes. For details on how to deploy files to the preview profile, see 'Deployment'.

### Deployment

Deployment of configuration files to Funnelback cannot be done programmatically, and must be done using the [web interface](https://york.funnelback.co.uk/search/admin).

While logged in to the Funnelback admin console, find the collection you wish to make a change to and select 'Browse Collection Configuration Files'.
From here you will see a list of configuration files for each profile. In order to publish a configuration file to Live, 
it must first be pushed to 'Preview'.

#### To deploy a file

The simplest method of uploading/updating a file is to use the file picker at the bottom of the section. 
There is also a drop-down menu that allows for the creation of new files that indicates the possible filenames that will be recognised by Funnelback.

![File picker](https://user-images.githubusercontent.com/68321515/91434581-f0095480-e85c-11ea-9480-f95f217d6a46.png)

When uploading a new version of an existing file, the old one will be archived with a date-time stamp within Funnelback.
This allows for a change to be quickly reverted by using the 'Restore' option on an archived version.

Funnelback also provides a visual interface for viewing/editing existing files. 
Click on the name of the file you want to edit in the preview section to open the editor. 
You will need to copy the code from the matching file in Source Control to overwrite the file, and then click **Save**.

Test that the file is working by running an example search, then when you are satisfied return to the config list and click **Publish** to publish that file to Live.

Due to Funnelback updates it is no longer possible to upload `collection.cfg` in this way. Because it must now be edited in the UI 
it is recommended that changes are made in the UI first, and then copied into this repo. To do this select 
'Edit Collection Configuration' under the 'Administer' tab. From there you can select 'Edit raw text' (pictured below) to
get the file contents.

![Screenshot from 2021-03-18 09-19-53](https://user-images.githubusercontent.com/68321515/111607218-f4349980-87cf-11eb-989b-89003d866c69.png)

## Documentation

The [customised Swagger-UI](https://university-of-york.github.io/uoy-config-funnelback-courses/) has been set up by following [these instructions](https://wiki.york.ac.uk/display/ittechdocs/Hosting+API+Documentation+with+Swagger+UI). For development documentation and ADR history, there is more information available at the [Course Search wiki](https://github.com/university-of-york/uoy-app-course-search/wiki).

## Contact

- [Digital Platforms and Developments Team](mailto:marketing-support@york.ac.uk)
- [Enterprise Systems Teaching and Learning Team](mailto:esg-teaching-and-learning-group@york.ac.uk)

## Licence

MIT
