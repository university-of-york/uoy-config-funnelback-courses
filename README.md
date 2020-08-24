# UOY-CONFIG-FUNNELBACK-COURSES
This repo contains configuration for the University of York's course search powered by [Funnelback](https://www.funnelback.com/).

## Funnelback

### Search Template
Search templates are *.ftl files that determine the format of results from Funnelback.

### Collection
A Funnelback collection is a set of data that can be searched. It is possible for collections to contain other collections, 
as the york-uni-campusmap collection contains others.

The course collection is called *york-uni-courses*.

### Development
Useful resources:
* [Funnelback Documentation](https://docs.funnelback.com/)
* [OpenAPI Documentation](https://swagger.io/specification/)

### Testing
The York-uni-courses collection has two profiles, for 'Live' and 'Preview'. The preview profile can be used for testing 
purposes. For details on how to deploy files to the preview profile, see 'Deployment'.

### Deployment
Deployment of configuration files to Funnelback cannot be done programmatically, and must be done using the web interface.

While logged in to the Funnelback admin console, find the *york-uni-courses* collection and select 'Browse Collection Configuration Files'.
From here you will see a list of configuration files for each profile. In order to publish a configuration file to Live, 
it must first be pushed to 'Preview'.

#### To deploy a file:
The simplest method of uploading/updating a file is to use the file picker at the bottom of the section. 
There is also a drop-down menu that allows for the creation of new files that indicates the possible filenames that will be recognised by Funnelback.

When uploading a new version of an existing file, the old one will be archived with a date-time stamp within Funnelback.
This allows for a change to be quickly reverted by using the 'Restore' option on an archived version.

Funnelback also provides a visual interface for viewing/editing existing files. 
Click on the name of the file you want to edit in the preview section to open the editor. 
You will need to copy the code from the matching file in Source Control to overwrite the file, and then click **Save**.

Test that the file is working by running an example search, then when you are satisfied return to the config list and click **Publish** to publish that file to Live.
## OpenAPI Specification
The OpenAPI specification can be viewed at https://university-of-york.github.io/uoy-config-funnelback-courses. It is served 
here as a static site using a distribution of [Swagger-UI](https://github.com/swagger-api/swagger-ui/tree/master/dist).
