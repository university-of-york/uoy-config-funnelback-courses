# Funnelback Courses API

This repo contains configuration for the University of York's Course Search powered by [Funnelback](https://www.funnelback.com/). 
This configures a collection of course information within Funnelback, which can be queried as an API returning JSON.

## Related Repos

- [Course Search](https://github.com/university-of-york/uoy-app-course-search) - the user-facing Course Search application on the University of York website.
- [Courses API](https://github.com/university-of-york/uoy-api-courses) - the API that provides Course Search functionality and in turn calls the Funnelback Courses API.

## Comsuming the API

The Funnelback Courses API is available at [https://york.funnelback.co.uk/search?collection=york-uni-courses&profile=_default&form=course-search&smeta_contentType=course&query=History](https://york.funnelback.co.uk/search?collection=york-uni-courses&profile=_default&form=course-search&smeta_contentType=course&query=History) (update the `query` parameter with your search term).

Currently this defaults to bringing back 10 results.
* To retrieve 25 entries in the results array, add `&num_ranks=25` to the URL.
* To retrieve from entry 11, add `&start_rank=11` to the URL.

The [latest version of the API specification](https://university-of-york.github.io/uoy-config-funnelback-courses) is published and kept up-to-date automatically. It is defined using the [OpenAPI specification](https://swagger.io/docs/specification/about/) and is served as a static site using a distribution of [Swagger-UI](https://github.com/swagger-api/swagger-ui/tree/master/dist).

## Funnelback

### Collections

A Funnelback collection is a set of data that can be searched. It is possible for collections to contain other collections, as the `york-uni-campusmap` collection contains others.

The course collection is called `york-uni-courses`.

### Search Templates

Search templates are `*.ftl` files that determine the format of results from Funnelback.

The __course-search template__ outputs just the course fields the Courses API requires as a Funnelback response in JSON format, 
with callback if 'callback' parameter is included in query string. 

In the version of Funnelback currently in use (15.10), it requires the following line in the collections.cfg file so it 
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

The `york-uni-courses` collection has two profiles, for 'Live' and 'Preview'. The preview profile can be used for testing 
purposes. For details on how to deploy files to the preview profile, see 'Deployment'.

### Deployment

Deployment of configuration files to Funnelback cannot be done programmatically, and must be done using the [web interface](https://york.funnelback.co.uk/search/admin).

While logged in to the Funnelback admin console, find the *york-uni-courses* collection and select 'Browse Collection Configuration Files'.
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

## Documentation

The [customised Swagger-UI](https://university-of-york.github.io/uoy-config-funnelback-courses/) has been set up by following [these instructions](https://wiki.york.ac.uk/display/ittechdocs/Hosting+API+Documentation+with+Swagger+UI).

## Contact

- [Digital Platforms and Developments Team](mailto:marketing-support@york.ac.uk)
- [Enterprise Systems Teaching and Learning Team](mailto:esg-teaching-and-learning-group@york.ac.uk)

## Licence

MIT
