# UOY-CONFIG-FUNNELBACK-COURSES
This repo contains configuration for the University of York's course search powered by [Funnelback](https://www.funnelback.com/).

## Funnelback

### Search Template
Search templates are *.ftl files that determine the format of results from Funnelback.

### Collection
A Funnelback collection is a set of data that can be searched. It is possible for collections to contain other collections, 
as the york-uni-web main York collection contains others.

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

####To deploy a file:
Click on the name of the file you want to deploy in the preview section. This takes you to a visual editor. You will need
to copy the code from the matching file in Source Control to overwrite the file, and then click **Save**.

Test that the file is working by running an example search, then when you are satisfied return to the config list and click **Publish** to publish that file to Live.

If you are uploading a new file, use the file picker below the 'Preview' profile.

## OpenAPI Specification
The OpenAPI specification can be viewed at https://university-of-york.github.io/uoy-config-funnelback-courses. It is served 
here as a static site using a distribution of [Swagger-UI](https://github.com/swagger-api/swagger-ui/tree/master/dist).

## The Swagger UI

### Overview
The swagger UI allows the openAPI demonstration rendering of a Funnelback search return to be viewed in a way that users will find helpful.

### Swagger UI
The Swagger UI is available from github at this location: https://github.com/swagger-api/swagger-ui . 
It is downloaded in one repository however that breaks down into three parts. These parts are: 
    1)  The full Swagger UI:
        This is a traditional npm module intended for use in single-page applications that are capable of resolving dependencies (via Webpack, Browserify, etc).
    2)  The distribution file (dist):
        This is a dependency-free module that includes everything you need to serve Swagger UI in a server-side project, or a single-page application that can't resolve npm module dependencies. This resides in a folder called “dist”.
    3)  React Swagger UI:
        This is Swagger UI packaged as a React component for use in React applications.
Current and further information on the Swagger UI and its branches can be found on the Swagger UI repo Readme.md.

### openAPI output
The openAPI location is: /spec/openAPI.yml

### Modifications to the dist folder (swagger-ui folder on our git-hub repository) 
The following steps were undertaken to produce the version we use of the Swagger UI:

1)  The Swagger UI was downloaded from github and a local copy was created. 
2)  The dist folder was renamed to swagger-ui for use in our github repository. 
3)  The index.html that was in the swagger-ui  folder (formally the dist folder) was then moved down a level to the root of the Swagger UI package.
4)  The index.html had the following applied: 
    a)  A change all was undertaken against all paths that had “./” to now read “swagger-ui/”
    b)  The link to the openAPI was changed from the default link to that of the spec folders openAPI.yml 

### Output 
The team have chosen to use github pages as the way to host the Swagger UI, the output is available at: https://university-of-york.github.io/uoy-config-funnelback-courses/  This is a publicly accessible location. 
